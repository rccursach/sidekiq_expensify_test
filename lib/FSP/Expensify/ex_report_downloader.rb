require 'expensirb'
require 'expensirb/v1/constants'
require 'expensirb/v1/report'
require 'open-uri'
require 'csv'

module FSP
  module Expensify
    class ExReportDownloader

      def initialize(expensify_creds, template_path)
        Expensirb::Constants::CREDENTIALS[:partnerUserID] = expensify_creds[:user_id]
        Expensirb::Constants::CREDENTIALS[:partnerUserSecret] = expensify_creds[:user_secret]
        @template = template_path.nil? ? '' : load_template(template_path)
      end

      def download_reported_expenses(filters, label, is_test)
        results = []
        is_test = is_test.nil? ? false : is_test

        r = Expensirb::Report.new
        # if no filters, select from last day
        if filters.nil?
          filters = {
            startDate: (Time.now() - 3600 * 24).strftime("%Y-%m-%d")
          }
        end

        rep = r.export :post,
        {
          test: is_test,
          onReceive: {
            immediateResponse: ["returnRandomFileName"]
          },
          inputSettings: {
            type: "transactionList",
            filters: filters
          },
          outputSettings: {
            fileExtension: "csv"
          },
          onFinish: [
            {
              actionName: 'markAsExported',
              label: label
            }
          ]
        },
        @template

        if rep.code == 200
          csv_out = r.download(:post, { fileName: rep.body })
          csv = CSV.new(csv_out, { headers: true, skip_blanks: true })

          csv.each do |row|
            row = row.to_h
            results << flat_keys_to_nested(row)
          end
        end
        results
      end

      def load_template(file_path)
        template_raw = ''
        File.open(file_path, "r") do |f|
          f.each_line do |line|
            template_raw += line
          end
        end
        @template = URI::encode(template_raw)
      end

      private

      def flat_keys_to_nested(hash)
        hash.each_with_object({}) do |(key,value), all|
          key_parts = key.split('.').map!(&:to_sym)
          leaf = key_parts[0...-1].inject(all) { |h, k| h[k] ||= {} }
          leaf[key_parts.last] = value
        end
      end

    end
  end
end
#require 'ExReportDownloader'

module FSP
  class ExpensesImporter

    def initialize
    end

    def import(user_id, user_secret)
      template_path = 'ex_templates/all_csv.fm'
      is_test = true # if test, it shouldn't modify any records
      label = 'sqktest_imported'
      creds = {
        user_id: user_id,
        user_secret: user_secret
      }
      filters = {
        startDate: (Time.now() - 3600 * 24 * 360).strftime("%Y-%m-%d"),
        markedAsExported: label
      }

      erd = FSP::Expensify::ExReportDownloader.new(creds, template_path)
      expenses = erd.download_reported_expenses(filters, label, is_test)
    end

  end
end
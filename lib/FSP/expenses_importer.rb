#require 'ExReportDownloader'

module FSP
  class ExpensesImporter

    def initialize(user_id, user_secret)
      @user_id = user_id
      @user_secret = user_secret
    end

    def import
      template_path = 'ex_templates/all_csv.fm'
      label = 'sqktest_imported'
      is_test = false
      creds = {
        user_id: @user_id,
        user_secret: @user_secret
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
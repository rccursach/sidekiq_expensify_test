class ExpensesImporterJob

  def self.run
    orgs = Organization.all

    orgs.each do |org|
      expenses = []
      unless org.exp_setting.nil?
        e = FSP::ExpensesImporter.new(org.exp_setting.partnerId, org.exp_setting.partnerSecret)
        expenses = e.import
      end
      # if expenses were downloaded
      expenses.each do |ex|
        expense = create_from_hash(ex)
        expense.save unless expense.nil?
      end
    end
  end

  private

  def self.create_from_hash(hash)
    return nil unless hash.is_a? Hash
    return nil if hash[:expense][:transactionID].nil?
    
    e = ImportedExpense.new
    e.transactionID = hash[:expense][:transactionID].to_s
    e.unverified = hash[:expense][:unverified] == "true" ? true : false
    e.cardID = hash[:expense][:cardID].to_s
    e.reportID = hash[:expense][:reportID].to_s
    e.mcc = hash[:expense][:mcc].to_i
    e.tag = hash[:expense][:tag].to_s
    e.currency = hash[:expense][:currency].to_s
    e.billable = hash[:expense][:billable] == "true" ? true : false
    e.amount = hash[:expense][:amount].to_i
    e.inserted = DateTime.strptime(hash[:expense][:inserted], '%Y-%m-%d %H:%M:%S') rescue ''
    e.reimbursable = hash[:expense][:reimbursable] == "true" ? true : false
    e.details = hash[:expense][:details].to_s
    e.currencyConversionRate = hash[:expense][:currencyConversionRate].to_i
    e.created = DateTime.strptime(hash[:expense][:created], '%Y-%m-%d %H:%M:%S') rescue ''
    e.modifiedAmount = hash[:expense][:modifiedAmount].to_i
    e.bank = hash[:expense][:bank].to_s
    e.receiptID = hash[:expense][:receiptID].to_s
    e.receiptFilename = hash[:expense][:receiptFilename].to_s
    e.modifiedCreated = DateTime.strptime(hash[:expense][:modifiedCreated], '%Y-%m-%d %H:%M:%S') rescue ''
    e.merchant = hash[:expense][:merchant].to_s
    e.externalID = hash[:expense][:externalID].to_s
    e.convertedAmount = hash[:expense][:convertedAmount].to_i
    e.modified = hash[:expense][:modified] == "true" ? true : false
    e.category = hash[:expense][:category].to_s
    e.modifiedMerchant = hash[:expense][:modifiedMerchant].to_s
    e.comment = hash[:expense][:comment].to_s
    e.cardNumber = hash[:expense][:cardNumber].to_s
    e.transactionHash = hash[:expense][:transactionHash].to_i
    e.modifiedMCC = hash[:expense][:modifiedMCC].to_s

    return e
  end
end
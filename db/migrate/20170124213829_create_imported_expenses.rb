class CreateImportedExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :imported_expenses do |t|
      t.string :transactionID
      t.boolean :unverified
      t.string :cardID
      t.string :reportID
      t.integer :mcc
      t.string :tag
      t.string :currency
      t.boolean :billable
      t.integer :amount
      t.datetime :inserted
      t.boolean :reimbursable
      t.string :details
      t.integer :currencyConversionRate
      t.datetime :created
      t.integer :modifiedAmount
      t.string :bank
      t.string :receiptID
      t.string :receiptFilename
      t.datetime :modifiedCreated
      t.string :merchant
      t.string :externalID
      t.integer :convertedAmount
      t.boolean :modified
      t.string :category
      t.string :modifiedMerchant
      t.string :comment
      t.string :cardNumber
      t.integer :transactionHash
      t.string :modifiedMCC
    end
  end
end

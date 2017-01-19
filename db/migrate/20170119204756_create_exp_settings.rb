class CreateExpSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :exp_settings do |t|
      t.references :organization, foreign_key: true
      t.string :partnerSecret
      t.string :partnerId

      t.timestamps
    end
  end
end

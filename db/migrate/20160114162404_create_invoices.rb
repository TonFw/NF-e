class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :nfe_code, limit: 75, null: false
      t.text :json_body, limit: 64.kilobytes-1, null: true
      t.belongs_to :batch, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
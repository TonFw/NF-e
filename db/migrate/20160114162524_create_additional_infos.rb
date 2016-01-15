class CreateAdditionalInfos < ActiveRecord::Migration
  def change
    create_table :additional_infos do |t|
      t.string :key, limit: 55, null: false
      t.text :value, limit: 64.kilobytes-1, null: true
      t.belongs_to :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
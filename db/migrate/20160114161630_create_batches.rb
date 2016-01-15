class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.boolean :processed
      t.timestamps null: false
    end
  end
end
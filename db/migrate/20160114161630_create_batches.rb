class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|

      t.timestamps null: false
    end
  end
end

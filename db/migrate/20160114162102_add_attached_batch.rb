class AddAttachedBatch < ActiveRecord::Migration
  def change
    add_column :batches, :attached, :string
  end
end
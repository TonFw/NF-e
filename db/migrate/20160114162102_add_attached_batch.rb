class AddAttachedBatch < ActiveRecord::Migration
  def self.up
    change_table :batches do |t|
      t.attachment :attached, null: false,  after: :id
    end
  end

  def self.down
    remove_attachment :batches, :attached
  end
end
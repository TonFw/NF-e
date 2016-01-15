class Batch < ActiveRecord::Base
  # Relations
  has_many :invoices

  # Upload GEM setting
  mount_uploader :attached, AttachmentUploader
end
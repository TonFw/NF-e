class Batch < ActiveRecord::Base
  # Concerns Dependencies
  include ProcessBatch
  include ProcessBatchDir
  include ProcessBatchCommands

  # Relations
  has_many :invoices

  # Upload GEM setting
  mount_uploader :attached, AttachmentUploader

  # Rails Validations
  validates :attached_file_name, length: { minimum: 4, maximum: 255 }, presence: true

  # Custom Validations
  validate :attached_type, on: :create

  # Readable file name
  def attached_file_name
    self.attached.filename
  end

  # Process the Batch
  def process_it
    # Prevent bugs
    return true if self.processed?

    # Setup Resp
    process_resp = {}
    process_resp[:unzipped] = unzip
    process_resp[:invoices] = setup_invoices
    process_resp[:tmp_removed] = remove_tmp

    # Update state
    self.processed = true
    self.save

    process_resp
  end

  private
    # Validate attached type
    def attached_type
      if self.attached.filename.downcase.index('.zip').nil?
        self.errors.add(:attached, 'A extensão deve ser .zip')
        raise ActiveRecord::Rollback
      end
    end
end
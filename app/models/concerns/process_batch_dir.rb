module ProcessBatchDir
  extend ActiveSupport::Concern

  # Retrieve it project upload zipped files
  def zip_folder
    self.attached.path
  end

  # The unzip destination folder
  def unzipped_target_folder
    "#{Rails.root.join('public')}/unzipped/tmp"
  end
end
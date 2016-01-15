module ProcessBatchCommands
  extend ActiveSupport::Concern

  # Command: to unzip it ZIP batch file
  def unzip
    cmd = "unzip #{zip_folder} -d #{unzipped_target_folder}"
    system cmd
  end

  # Remove the unzipped files
  def remove_tmp
    cmd = "rm -rf #{unzipped_target_folder}"
    system cmd
  end
end
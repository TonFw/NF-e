module ProcessBatch
  extend ActiveSupport::Concern

  # Persist & Process it invoices
  def setup_invoices
    # Get the unzipped files on the folder
    files = Dir.glob("#{unzipped_target_folder}/*")

    # Setup it Invoices
    files.each do |file|
      next if file.index('.xml').nil?
      hash_invoice = Hash.from_xml(File.open(file)).deep_symbolize_keys!

      invoice_params = {nfe_code: hash_invoice[:NFe][:infNFe][:Id], json_body: hash_invoice.to_json}
      self.invoices << Invoice.new(invoice_params)
    end
  end
end
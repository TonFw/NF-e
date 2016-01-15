module ProcessBatch
  extend ActiveSupport::Concern

  # Persist & Process it invoices
  def setup_invoices
    # Get the unzipped files on the folder
    files = Dir.glob("#{unzipped_target_folder}/*")

    # Setup it Invoices
    files.each do |file|
      next if file.index('.xml').nil?
      nfe_xml = File.open(file, 'rb').read
      hash_invoice = Hash.from_xml(nfe_xml).deep_symbolize_keys!

      invoice_params = {nfe_code: hash_invoice[:NFe][:infNFe][:Id], body: nfe_xml}
      current_invoice = Invoice.new(invoice_params)
      self.invoices << current_invoice
    end
  end
end
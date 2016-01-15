require 'rails_helper'

RSpec.describe Batch, type: :model do
  subject(:batch) { Batch.first }
  subject(:process_resp) { batch.process_it }

  describe 'Process it Batch invoices' do
    context  'unzip' do
      it 'must be unzipped on a folder' do
        expect(process_resp).to be_a_kind_of Hash
        expect(process_resp[:error]).to_not be_nil
      end
    end
  end
end
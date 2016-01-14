require 'rails_helper'

RSpec.describe "batches/show", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

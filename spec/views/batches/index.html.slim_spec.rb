require 'rails_helper'

RSpec.describe "batches/index", type: :view do
  before(:each) do
    assign(:batches, [
      Batch.create!(),
      Batch.create!()
    ])
  end

  it "renders a list of batches" do
    render
  end
end

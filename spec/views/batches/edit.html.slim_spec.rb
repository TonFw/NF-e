require 'rails_helper'

RSpec.describe "batches/edit", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!())
  end

  it "renders the edit batch form" do
    render

    assert_select "form[action=?][method=?]", batch_path(@batch), "post" do
    end
  end
end

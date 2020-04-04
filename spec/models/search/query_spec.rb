require 'rails_helper'

RSpec.describe Search::Query, type: :model do
  it "ensures the status is set to 'abandoned' by default" do
    expect(Search::Query.new.status.to_s).to eq('abandoned')
  end
end

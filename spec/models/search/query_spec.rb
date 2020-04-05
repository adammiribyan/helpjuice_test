require 'rails_helper'

RSpec.describe Search::Query, type: :model do
  it "ensures the status is set to 'abandoned' by default" do
    expect(Search::Query.new.status.to_s).to eq('abandoned')
  end

  describe 'similarity and distance' do
    it 'checks query closeness' do
      expect_query_similarity('how do i', 'how do i cancel').to be > 0.6
      expect_query_distance('how do i', 'how do i cancel').to be < 15
      expect_query_distance('how do i cancel my account', 'where is the page').to be > 15
    end
  end

  private

  def expect_query_similarity(body1, body2)
    expect(build_query(body1).similarity build_query(body2))
  end

  def expect_query_distance(body1, body2)
    expect(build_query(body1).distance build_query(body2))
  end

  def build_query(body)
    Search::Query.new(body: body)
  end
end

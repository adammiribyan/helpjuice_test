class Search::Query < ApplicationRecord
  enum status: %i[ abandoned engaged ]

  scope :chronologically, -> { order 'created_at asc, id asc' }
  scope :reverse_chronologically, -> { order 'created_at desc, id desc' }
  scope :by_body, -> { group_by(&:body) }

  AVERAGE_LIVE_SEARCH_DURATION = 30.seconds

  class << self
    def distinct_creators_count_for_query(query)
      where(body: query.body).distinct.count(:creator_token)
    end
  end

  def recently_previous
    self.class
      .where(creator_token: creator_token, created_at: AVERAGE_LIVE_SEARCH_DURATION.ago..Time.current)
      .chronologically.last
  end

  concerning :EditDistance do
    def similarity(query)
      return nil unless query.respond_to?(:body)
      Edits::JaroWinkler.similarity body, query.body
    end

    def similar_to?(query)
      distance(query) < 15 && similarity(query) > 0.6
    end

    def distance(query)
      Edits::DamerauLevenshtein.distance body, query.body
    end
  end
end

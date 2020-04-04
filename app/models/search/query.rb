class Search::Query < ApplicationRecord
  enum status: %i[ abandoned engaged ]

  scope :by_body, -> { group_by(&:body).map { |count, queries|
    [count, queries, queries.sort_by(&:created_at).last]
  }}
end

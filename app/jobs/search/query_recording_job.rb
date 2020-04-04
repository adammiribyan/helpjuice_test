class Search::QueryRecordingJob < ApplicationJob
  queue_as :default

  def perform(body:, results_count:)
    Search::Query.create!(body: normalize_search_query(body), results_count: results_count)
  end

  private

  def normalize_search_query(value)
    value.strip.downcase
  end
end

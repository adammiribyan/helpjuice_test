class Search::QueryRecordingJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    query = Search::Query.new(attributes)
    previous_query = query.recently_previous

    if previous_query.presence && query.similar_to?(previous_query)
      previous_query.update!(body: query.body, results_count: query.results_count)
    else
      query.save!
    end
  end

  private

  def normalize_search_query(value)
    value.strip.downcase
  end
end

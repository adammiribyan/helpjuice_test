class Search::ArticlesController < ApplicationController
  after_action :record_search_query, if: -> { params[:query].present? }

  def index
    @articles = Article.filter(params)

    respond_to do |format|
      format.any(:html, :js)
    end
  end

  private

  def record_search_query
    Search::QueryRecordingJob.perform_later(
      body: params[:query],
      results_count: @articles.size,
      creator_token: Current.identity_token
    )
  end
end

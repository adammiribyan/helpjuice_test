class Search::AnalyticsController < ApplicationController
  def show
    @queries = Search::Query.all
  end
end

class Search::QueriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    query = Search::Query.find(params[:id])
    @related_queries = Search::Query.where.not(id: query.id).where(body: query.body)

    respond_to do |format|
      format.js
    end
  end

  # TODO: Update query status when it's engaged, e.g. when the user 
  # follows a search result link.
  def update
  end

  private

  def query_params
    params.require(:query).permit(:status)
  end
end

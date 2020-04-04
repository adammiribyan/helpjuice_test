module Article::Filterable
  extend ActiveSupport::Concern
  include PgSearch::Model

  included do
    include PgSearch::Model

    pg_search_scope(:search, against: %i[ title ], using: {
      tsearch: { prefix: true }
    })
  end

  class_methods do
    def filter(params = {})
      relation = self
      relation = relation.search(params[:query]) if params.fetch(:query, false).present?
      relation.all
    end
  end
end

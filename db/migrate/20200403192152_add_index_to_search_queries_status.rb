class AddIndexToSearchQueriesStatus < ActiveRecord::Migration[6.0]
  def change
    add_index :search_queries, :status
  end
end

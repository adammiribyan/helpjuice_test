class AddCreatorTokenToSearchQueries < ActiveRecord::Migration[6.0]
  def change
    add_column :search_queries, :creator_token, :string
    add_index :search_queries, :creator_token
  end
end

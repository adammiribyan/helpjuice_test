class CreateSearchQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :search_queries do |t|
      t.string :body
      t.integer :results_count
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

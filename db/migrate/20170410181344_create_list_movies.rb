class CreateListMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :list_movies do |t|
      t.references :list, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end

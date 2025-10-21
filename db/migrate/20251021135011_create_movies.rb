class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.integer :release_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

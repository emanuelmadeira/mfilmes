class CreateComentarios < ActiveRecord::Migration[8.0]
  def change
    create_table :comentarios do |t|
      t.text :conteudo
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
  end
end

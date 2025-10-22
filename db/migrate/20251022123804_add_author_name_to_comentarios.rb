class AddAuthorNameToComentarios < ActiveRecord::Migration[8.0]
  def change
    add_column :comentarios, :author_name, :string
  end
end

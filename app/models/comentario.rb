# app/models/comentario.rb
class Comentario < ApplicationRecord
  # belongs_to :user  # Removemos a associação obrigatória com User
  validates :conteudo, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :author_name, presence: true, length: { minimum: 2, maximum: 50 }

  # Métodos para simular as associações
  def movie
    Movie.find_by(id: movie_id)
  end

  def user
    User.find_by(id: user_id) if user_id
  end

  def author_display_name
    user_id ? user.name : author_name
  end

  def anonymous?
    user_id.nil?
  end
end
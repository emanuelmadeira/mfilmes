class Comentario < ApplicationRecord
  belongs_to :user
  
  
  validates :conteudo, presence: true, length: { minimum: 2, maximum: 1000 }
  
  # Métodos para simular a associação
  def movie
    Movie.find_by(id: movie_id)
  end
  
  def user
    User.find_by(id: user_id)
  end
end

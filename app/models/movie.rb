class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :title, presence: true
  validates :release_year, numericality: { 
    only_integer: true, 
    greater_than: 1900, 
    less_than_or_equal_to: Date.today.year 
  }
  
  # MÉTODOS MANUAIS PARA COMENTÁRIOS
  def comentarios
    Comentario.where(movie_id: id).order(created_at: :desc)
  end
  
  def comentarios_count
    Comentario.where(movie_id: id).count
  end
  
  def build_comentario(attributes = {})
    Comentario.new(attributes.merge(movie_id: id))
  end
end

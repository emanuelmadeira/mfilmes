# app/models/user.rb
class User < ApplicationRecord
  # has_secure_password
  
  has_many :movies, dependent: :destroy
  has_many :comentarios, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validate :password_strength, on: :create
  
  private
  
  def password_strength
    return if password.blank?
    
    # Mínimo 6 caracteres
    if password.length < 6
      errors.add(:password, 'deve ter pelo menos 6 caracteres')
    end
    
    # Pelo menos uma letra e um número (opcional - pode remover se quiser mais simples)
    unless password =~ /[a-zA-Z]/ && password =~ /\d/
      errors.add(:password, 'deve conter letras e números')
    end
  end
end
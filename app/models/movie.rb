class Movie < ApplicationRecord
  belongs_to :user  # singular "user"
  
  validates :title, presence: true
  validates :release_year, numericality: { 
    only_integer: true, 
    greater_than: 1900, 
    less_than_or_equal_to: Date.today.year 
  }
end
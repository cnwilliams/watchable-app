class Movie < ApplicationRecord
  has_many :list_movies,  dependent: :nullify
  has_many :lists, through: :list_movies
end

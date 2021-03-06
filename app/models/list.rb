class List < ApplicationRecord
  belongs_to :user
  has_many :list_movies
  has_many :movies, through: :list_movies, dependent: :destroy
end

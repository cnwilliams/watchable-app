class Movie < ApplicationRecord
  ##### DO NOT MODIFY #####
  has_many :list_movies,  dependent: :nullify
  has_many :lists, through: :list_movies
  #########################

  self.per_page = 10

end

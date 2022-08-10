class Genre < ApplicationRecord
  has_many :words, dependent: :destroy
end

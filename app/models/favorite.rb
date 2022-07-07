class Favorite < ApplicationRecord

  belongs_to :example_sentence
  belongs_to :user
end

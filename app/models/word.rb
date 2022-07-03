class Word < ApplicationRecord
  
  has_many :example_sentences, dependent: :destroy
  belongs_to :user
end

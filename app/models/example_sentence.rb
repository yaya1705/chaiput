class ExampleSentence < ApplicationRecord
  
  belongs_to :user
  belongs_to :word
  has_many :favorites
  
end

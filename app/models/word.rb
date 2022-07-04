class Word < ApplicationRecord

  has_many :example_sentences, dependent: :destroy
  belongs_to :user

   validates :jp_word, presence: true
   validates :cn_word, presence: true
   
end

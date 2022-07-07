class Word < ApplicationRecord

  has_many :example_sentences, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy

   validates :jp_word, presence: true
   validates :cn_word, presence: true

end

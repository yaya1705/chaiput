class ExampleSentence < ApplicationRecord

  belongs_to :user
  belongs_to :word
  has_many :favorites, dependent: :destroy
  has_many :book_mark, dependent: :destroy
  
  # ブックマークの中間テーブル
  has_many :sentence_book_mark, through: :book_mark, source: example_sentence
  
  
   validates :example_sentence, presence: true
end

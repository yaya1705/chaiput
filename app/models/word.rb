class Word < ApplicationRecord

  has_many :example_sentences, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  belongs_to :genre

   validates :pinyin, presence: true, length: { minimum: 2, maximum: 20 }
   validates :jp_word, presence: true, length: { minimum: 2, maximum: 20 }
   validates :cn_word, presence: true, length: { minimum: 1, maximum: 10 }, uniqueness: true
   validates :genre, presence: true

  
  def self.looks(word)
      @word = Word.where("cn_word LIKE?","%#{word}%")
  end

end

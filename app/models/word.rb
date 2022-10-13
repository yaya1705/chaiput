class Word < ApplicationRecord

  has_many :example_sentences, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  belongs_to :genre

   validates :pinyin, presence: true, length: { minimum: 2, maximum: 20 }
   validates :jp_word, presence: true, length: { minimum: 2, maximum: 20 }
   validates :cn_word, presence: true, length: { minimum: 1, maximum: 10 }, uniqueness: true
   validates :genre, presence: true

   # 検索方法分岐
  def self.looks(word)
    # if search == "perfect_match"
    #   @word = Word.where("cn_word LIKE?", "#{word}")
    # elsif search == "forward_match"
    #   @word = Word.where("cn_word LIKE?","#{word}%")
    # elsif search == "backward_match"
    #   @word = Word.where("cn_word LIKE?","%#{word}")
    # elsif search == "partial_match"
      @word = Word.where("cn_word LIKE?","%#{word}%")
    # else
      # @word = Word.all
    # end
  end

end

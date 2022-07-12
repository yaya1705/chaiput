class Word < ApplicationRecord

  has_many :example_sentences, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy

   validates :jp_word, presence: true
   validates :cn_word, presence: true

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

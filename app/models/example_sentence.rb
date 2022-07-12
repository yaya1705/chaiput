class ExampleSentence < ApplicationRecord

  belongs_to :user
  belongs_to :word
  has_many :favorites, dependent: :destroy
  has_many :book_marks, dependent: :destroy

   validates :sentences, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

   # 検索方法分岐
  def self.looks(search, word)
    # if search == "perfect_match"
    #   @example_sentence = ExampleSentence.where("sentences LIKE?", "#{word}")
    # elsif search == "forward_match"
    #   @example_sentence = ExampleSentence.where("sentences LIKE?","#{word}%")
    # elsif search == "backward_match"
    #   @example_sentence = ExampleSentence.where("sentences LIKE?","%#{word}")
    # elsif search == "partial_match"
      @example_sentence = ExampleSentence.where("sentences LIKE?","%#{word}%")
    # else
    #   @example_sentence = ExampleSentence.all
    # end
  end


end

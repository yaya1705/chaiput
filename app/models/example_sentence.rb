class ExampleSentence < ApplicationRecord

  belongs_to :user
  belongs_to :word
  has_many :favorites, dependent: :destroy

   validates :sentences, presence: true, length: { minimum: 2, maximum: 50 }
   validates :sentences_jp, presence: true, length: { minimum: 2, maximum: 50 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  def self.looks(search, word)
      @example_sentence = ExampleSentence.where("sentences LIKE?","%#{word}%")
  end


end

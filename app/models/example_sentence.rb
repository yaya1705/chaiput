class ExampleSentence < ApplicationRecord

  belongs_to :user
  belongs_to :word
  has_many :favorites, dependent: :destroy
  has_many :book_marks, dependent: :destroy

   validates :sentences, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :words, dependent: :destroy
         has_many :example_sentences, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :book_marks, dependent: :destroy

         # バリテーション
         validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true, presence: true

        # ユーザーのプロフィール画像
         has_one_attached :profile_image

         def get_profile_image(width, height)
          unless profile_image.attached?
            file_path = Rails.root.join('app/assets/images/default-image.jpeg')
            profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
          end
         　　profile_image.variant(resize_to_limit: [width, height]).processed
         end
end
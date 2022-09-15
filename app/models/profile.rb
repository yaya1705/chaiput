class Profile < ApplicationRecord
  belongs_to :user

  # ユーザーのプロフィール画像
  has_one_attached :profile_image

  validates :introduction, length: { maximum: 75 }


  def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/default-image.jpeg')
         profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
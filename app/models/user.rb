class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :words, dependent: :destroy
         has_many :example_sentences, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :book_marks, dependent: :destroy
         has_one :profile

        # has_many :sentence_book_mark, through: :book_mark, source: example_sentence

         # バリテーション
         validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true, presence: true

         # プロフィールの準備,論理演算　プロフィールがあればprofile更新 build_profile新規作成
         def profile_prepare
             profile || build_profile
         end

         # ボッチ演算子 &.
        # def profile_image
        #   if profile&.image&.attached?
        #     profile.image
        #   else
        #   'default-image.jpeg'
        #   end
        # end

        def profile_image
          if profile&.profile_image&.attached?
             profile.profile_image
          else
              'default-image.jpeg'
          end
        end
          def switch_flg(obj)
            obj ? false : true
          end

         def self.guest
            find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
              user.password = SecureRandom.urlsafe_base64
              user.name = "guestuser"
         end
         end

        #  退会処理
         def active_for_authentication?
            super && (is_deleted == false)
         end

        # フォローをした、されたの関係
        has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

        # 一覧画面で使う source=参照するカラム
        has_many :followings, through: :relationships, source: :followed
        has_many :followers, through: :reverse_of_relationships, source: :follower

        # フォローしたときの処理
        def follow(user_id)
          relationships.create(followed_id: user_id)
        end
        # フォローを外すときの処理
        def unfollow(user_id)
          relationships.find_by(followed_id: user_id).destroy
        end
        # フォローしているか判定
        def following?(user)
          followings.include?(user)
        end

end
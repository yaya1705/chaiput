class Relationship < ApplicationRecord
  
   # follower : フォローしたユーザー
    belongs_to :follower, class_name: "User"
     # followed : フォローされたユーザー
    belongs_to :followed, class_name: "User"
    
end

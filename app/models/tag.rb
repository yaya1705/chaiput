class Tag < ApplicationRecord
  has_many :word_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :words, through: :word_tags
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#
class Comment < ApplicationRecord
  # Associations
  belongs_to :photo
  belongs_to :author, class_name: "User", foreign_key: :author_id

  # Validations
  validates :body, presence: true #, length: { maximum: 1000 }

  # Direct associations
  has_many  :comments, class_name: "Comment", foreign_key: "author_id", dependent: :destroy
  belongs_to :user, required: true, class_name: "User", foreign_key: "author_id"
  belongs_to :post, required: true, class_name: "Photo", foreign_key: "photo_id", counter_cache: true
end

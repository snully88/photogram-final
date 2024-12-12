# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :comments
  has_many :likes

  # Validations
  validates :image, presence: true
  #validates :caption, length: { maximum: 300 }
  has_many  :comments, class_name: "Comment", foreign_key: "photo_id", dependent: :destroy

  mount_uploader :image, ImageUploader
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_url             :string
#  comments_count         :integer
#  email                  :string
#  encrypted_password     :string
#  likes_count            :integer
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photos, foreign_key: :owner_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :fan_id
  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: :sender_id
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: :recipient_id

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end

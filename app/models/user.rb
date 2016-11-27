class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :nickname
  devise :database_authenticatable, 
  			 :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  mount_uploader :avatar, AvatarUploader
  validate :avatar_image_size

  has_many :posts, dependent: :destroy
  has_many :comments

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

    def avatar_image_size
      if avatar.size > 5.megabytes
        errors.add(:avatar, "should be less than 5MB")
      end
    end
end

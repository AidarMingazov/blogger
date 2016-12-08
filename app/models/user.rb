class User < ApplicationRecord
  devise :database_authenticatable, 
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable
  
  validates :email, uniqueness: { case_sensitive: false, message: 'email already registered' }
  validates :first_name, length: { in: 2..12, too_short: 'too short first name', too_long: 'too long first name' }
  validates :last_name, length: { in: 2..12, too_short: 'too short last name', too_long: 'too long last name' }
  validates :nickname, uniqueness: { case_sensitive: false, message: '@nickname must be  uniq' }, 
            length: { in: 2..12, too_short: 'too short nickname', too_long: 'too long nickname' }

  mount_uploader :avatar, AvatarUploader
  validate :avatar_image_size

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Too complex
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  # Too complex
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def User.new_token
    SecureRandom.urlsafe_base64
  end

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

    def generate_authentication_token
      loop do
        self.authentication_token = SecureRandom.base64(64)
        break unless User.find_by(authentication_token: authentication_token)
      end
    end
end

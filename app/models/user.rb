# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :member_circles, through: :circle_memberships, source: :circle
  has_many :circle_memberships
  has_many :circles
  has_many :posts

  has_many :shared_posts, through: :member_circles, source: :posts

  def self.find_by_credentials(username, password)
    return nil unless @user = User.find_by_email(username)
    b_crypto = BCrypt::Password.new(@user.password_digest)
    if b_crypto.is_password?(password)
      @user.password = password
      return @user
    else
      nil
    end
  end

  def password=(password)
    return unless password.present?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
end

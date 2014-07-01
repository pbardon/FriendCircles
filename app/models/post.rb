# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  belongs_to :user
  
  has_many :post_shares
  has_many :circles, through: :post_shares, source: :circle
  has_many :links, inverse_of: :post
  #
  # has_many :viewers, through: :post_shares, source: :viewers
  
  validates :body, presence: true
  validates :user_id, presence: true
end

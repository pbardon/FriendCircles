# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Circle < ActiveRecord::Base
  belongs_to :owner, foreign_key: :user_id, class_name: :User
  has_many :memberships, class_name: "CircleMembership"
  has_many :members, through: :memberships, source: :user

  has_many :post_shares

  has_many :posts, through: :post_shares, source: :post
end

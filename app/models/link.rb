# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)      not null
#  post_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  validates :title, :url, :post, presence: true

  belongs_to :post, inverse_of: :links
end

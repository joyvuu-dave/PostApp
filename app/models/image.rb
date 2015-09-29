# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

class Image < ActiveRecord::Base
  belongs_to :post
end

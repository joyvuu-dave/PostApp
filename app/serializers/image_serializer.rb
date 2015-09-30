# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_images_on_post_id  (post_id)
#

class ImageSerializer < ActiveModel::Serializer
  attributes :id,
             :url
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#

class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content,
             :author_name,
             :author_city,
             :images

  def author_name
    object.author.name
  end

  def author_city
    object.author.city
  end

  def images
    ActiveModel::ArraySerializer.new(object.images, each_serializer: ImageSerializer)
  end
end

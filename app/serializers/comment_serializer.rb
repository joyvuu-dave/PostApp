# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string
#
# Indexes
#
#  index_comments_on_ancestry  (ancestry)
#  index_comments_on_post_id   (post_id)
#  index_comments_on_user_id   (user_id)
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id,
             :body,
             :children

  def children
    ActiveModel::ArraySerializer.new(object.children, each_serializer: CommentSerializer)
  end
end

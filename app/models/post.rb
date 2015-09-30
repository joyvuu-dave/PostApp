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

class Post < ActiveRecord::Base 
  belongs_to :user, foreign_key: 'author_id'
  alias_attribute :author, :user

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user, presence: true
end

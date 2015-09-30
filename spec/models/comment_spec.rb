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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'can create a comment' do 
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    
    comment = FactoryGirl.create(:comment, body: "That's a really good point.", post_id: post.id, user_id: user.id)

    expect(comment).to be_a(Comment)
  end
end

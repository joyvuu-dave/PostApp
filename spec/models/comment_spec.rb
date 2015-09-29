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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'can create a comment' do 
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    
    comment = FactoryGirl.create(:comment, body: "That's a really good point.", post_id: post.id, user_id: user.id)

    expect(comment).to be_a(Comment)
  end
end

require 'rails_helper'

RSpec.describe 'Comments API', type: :request do 
  it 'can get a nested list of comments' do 
    post = FactoryGirl.create(:post)
    comment_1 = FactoryGirl.create(:comment, post_id: post.id)
    subcomment_2 = FactoryGirl.create(:comment, post_id: post.id, parent_id: comment_1.id)
    comment_3 = FactoryGirl.create(:comment, post_id: post.id)

    get "/api/comments/?post_id=#{post.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json[0]['body']).to eq(comment_1.body)
    expect(json[0]['children'][0]['id']).to eq(subcomment_2.id)
  end

  it 'can create a comment' do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)

    post "/api/comments", comment: { post_id: post.id, user_id: user.id, body: 'Neat article, bro' }

    expect(response).to be_success
    expect(Comment.last.body).to eq('Neat article, bro')
  end

  it 'can delete a comment' do 
    comment = FactoryGirl.create(:comment)
    expect(Comment.find_by_id(comment.id)).not_to eq(nil)

    delete "/api/comments/#{comment.id}"

    expect(response).to be_success
    expect(Comment.find_by_id(comment.id)).to eq(nil)
  end
end

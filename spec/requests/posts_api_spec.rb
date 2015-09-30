require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  before(:all) do 
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, { author_id: @user.id, title: 'Birdwatching in the 21st Century',  
                                        content: 'Birdsnap—a new app developed with the help of a University
                                                  of Maryland computer scientist—can identify birds from photos, 
                                                  using methods borrowed from facial recognition software. Simply 
                                                  snap a photo of a bird, and the app can tell you what species it 
                                                  is and all about it.'})
  end

  it 'returns the 10 most recent posts' do 
    FactoryGirl.create_list(:post, 20)
    
    get '/api/posts'
    
    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.length).to eq(10)
    expect(json[0]['id']).to eq(Post.last.id)
  end

  it 'can create a post' do 
    user = FactoryGirl.create(:user)
    post '/api/posts', post: { author_id: user.id, title: 'Is Tesla the Next AOL?',  content: 'Elon Musk made an important announcement yesterday...' }

    expect(response).to be_success
    expect(Post.last.title).to eq('Is Tesla the Next AOL?')
  end

  it 'can retrieve a single post' do 
    get "/api/posts/#{@post.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['id']).to eq(@post.id)
    expect(json['title']).to eq(@post.title)
    expect(json['content']).to eq(@post.content)
    expect(json['author_name']).to eq(@post.author.name)
  end

  it 'can update a post' do 
    patch "/api/posts/#{@post.id}", post: { title: '37 Signs your Dog is Secretly a Cat' }

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['title']).to eq('37 Signs your Dog is Secretly a Cat')
  end

  it 'can delete a post' do 
    delete "/api/posts/#{@post.id}"

    expect(response).to be_success
    expect(Post.find_by_id(@post.id)).to eq(nil)
  end
end

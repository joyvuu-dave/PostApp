require 'rails_helper'

RSpec.describe 'Images API', type: :request do 
  it 'can create an image' do 
    a_post = FactoryGirl.create(:post)

    post '/api/images', image: { post_id: a_post.id, 
                                 url: 'http://www.feelguide.com/wp-content/uploads/2011/02/BoingCatPhogo.jpg' }

    expect(response).to be_success
    expect(Image.last.url).to eq('http://www.feelguide.com/wp-content/uploads/2011/02/BoingCatPhogo.jpg')
  end

  it 'can delete an image' do 
    image = FactoryGirl.create(:image)
    expect(Image.find_by_id(image.id)).not_to eq(nil)

    delete "/api/images/#{image.id}"

    expect(response).to be_success
    expect(Image.find_by_id(image.id)).to eq(nil)
  end
end

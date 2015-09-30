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

require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'can create a image' do 
    post = FactoryGirl.create(:post)
    image = FactoryGirl.create(:image, post_id: post.id, url: 'http://s3.amazonaws.com/mongabay-images/12/DSC_0595.reticulatedgiraffe.boy.568.jpg')
    
    expect(image).to be_an(Image)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'can create a post' do 
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user_id: user.id, title: 'How to make millions in you spare time', 
                  content: 'Making money in your spare time is easy. First, purchase stock in
                            an undervalued but highly profitable company. Next, wait for that stock
                            to go up substantially in price. Finally, sell the stock and reap the rewards.')
    expect(post).to be_a(Post)
  end
end

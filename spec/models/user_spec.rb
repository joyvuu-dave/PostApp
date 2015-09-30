# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create a user' do 
    user = FactoryGirl.create(:user, name: 'Donald Trump', city: 'New York')
    expect(user).to be_a(User)
  end
end

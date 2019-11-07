# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = '  '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    dup_email = @user.dup
    @user.save
    assert_not dup_email.valid?
  end

  test 'email should not be too long' do
    @user.email = 'A' * 244 + '@example.com'
    assert_not @user.valid?
  end
end

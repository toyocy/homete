# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  display_name    :string           default("")
#  introduction    :text             default("")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
        username: 'testuser',
        display_name: 'テストユーザー',
        password: 'password',
        password_confirmation: 'password'
      )
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = ' '
    assert_not @user.valid?
  end

  test 'username should not be too long' do
    @user.username = 'a' * 21
    assert_not @user.valid?
  end

  test 'username should not be too short' do
    @user.username = 'a' * 3
    assert_not @user.valid?
  end

  test 'username should be unique' do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'display name should not be too long' do
    @user.display_name = 'A' * 31
    assert_not @user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end

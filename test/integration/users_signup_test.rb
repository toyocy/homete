require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid sign up information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          username: 'example-user',
          password: 'aa',
          password_confirmation: 'ab'
        }
      }
    end
    assert_template 'users/new'
  end

  test 'valid sign up information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {
        user: {
          username: 'exmaple-user',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end

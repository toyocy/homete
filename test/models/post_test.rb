# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string
#  crap       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'content should be prensence' do
    @post.content = ''
    assert_not @post.valid?
  end

  test 'crap should be only numeric' do
    @post.crap = 'a'
    assert_not @post.valid?
  end

  test 'crap should be only integer' do
    @post.crap = 1.5
    assert_not @post.valid?
  end
end

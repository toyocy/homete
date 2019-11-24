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

class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 250 }
  validates :crap, numericality: { only_integer: true }
end

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

class User < ApplicationRecord
  validates :username, presence: true, length: { in: 4..20 }, uniqueness: { case_sensitive: false }
  validates :display_name, length: { maximum: 30 }
  has_secure_password
  validates :password, presence: true, length: { in: 6..20 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

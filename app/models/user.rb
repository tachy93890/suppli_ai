# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # optional convenience method; or use enum role instead
  def admin?
    admin
  end
end

class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  def self.confirm(params)
    @user = User.find_by({username: params[:username]})
    @user.try(:authenticate, params[:password])
  end

  validates :email, uniqueness:true
  validates :username, uniqueness:true

end

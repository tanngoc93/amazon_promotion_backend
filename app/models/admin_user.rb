class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def after_database_authentication
    self.update(access_token: generate_token)
  end

  private

    def generate_token
      loop do
        token = Devise.friendly_token
        break token unless AdminUser.where(access_token: token).exists?
      end
    end
end

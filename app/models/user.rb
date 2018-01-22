class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    email_pure = email.strip.downcase #strip removes whitespace
    user = User.find_by_email(email_pure)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end

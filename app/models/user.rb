class User < ActiveRecord::Base
    has_many :jokes

    validates :username, :email, :password_digest, presence: true
    validates :username, :email, uniqueness: true 

    has_secure_password
end
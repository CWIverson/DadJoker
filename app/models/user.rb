class User < ActiveRecord::Base
    has_many :jokes

    # validates :username, :date_joined

    has_secure_password
end
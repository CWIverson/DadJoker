class User < ActiveRecord::Base
    has_many :jokes

    validates :username, :date_joined
end
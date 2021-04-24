class Joke < ActiveRecord::Base
    belongs_to :user

    # validates :jokes, :joke_type, :date
end
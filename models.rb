ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")

class Color < ActiveRecord::Base
    belongs_to :image
end

class Image < ActiveRecord::Base
    has_many :colors
end
class User < ActiveRecord::Base
	has_many :owners
	has_many :posts
	has_many :messages
end

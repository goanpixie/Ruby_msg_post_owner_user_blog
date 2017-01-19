class Blog < ActiveRecord::Base
	has_many :owners
	has_many :posts
end

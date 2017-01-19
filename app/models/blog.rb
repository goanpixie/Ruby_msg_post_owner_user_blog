class Blog < ActiveRecord::Base
	as_many :tips, as: :Tipable
	has_many :owners
	has_many :users, through: :owners
	has_many :posts
end

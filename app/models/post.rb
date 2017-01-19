class Post < ActiveRecord::Base
  as_many :tips, as: :Tipable
  belongs_to :blog
  belongs_to :user
  has_many :messages
end

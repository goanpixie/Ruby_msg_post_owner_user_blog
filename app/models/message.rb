class Message < ActiveRecord::Base
  has_many :tips, as: :Tipable
  belongs_to :post
  belongs_to :user
end

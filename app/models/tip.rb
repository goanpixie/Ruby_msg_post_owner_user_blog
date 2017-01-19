class Tip < ActiveRecord::Base
  belongs_to :Tipable, polymorphic: true
end

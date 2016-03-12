class User < ActiveRecord::Base
  has_many :votes

  validates :name, presence: true
end

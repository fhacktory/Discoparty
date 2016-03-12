class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  validates :vote_type, presence: true
  validates :user, presence: true
  validates :track, presence: true
end

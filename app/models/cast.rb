class Cast < ActiveRecord::Base
	extend FriendlyId
	friendly_id :episode, use: :slugged

	validates :episode, presence: true, uniqueness: { case_sensitive: false }
	validates :releasedate, presence: true
	validates :description, presence: true
	validates :embedcode, presence: true

	belongs_to :user
end

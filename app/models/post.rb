class Post < ActiveRecord::Base
	belongs_to :user
	has_many :favorites, dependent: :destroy

	validates :body, presence: true, length: { in: 1..140}
	validates :user_id, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	default_scope -> {order(created_at: :desc)}
end

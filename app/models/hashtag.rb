class Hashtag < ActiveRecord::Base
  has_many :tags

  belongs_to :actor
  belongs_to :organization

  attr_accessible :actor_id, :key, :organization_id, :tags_count, :value

  validates :key, presence: true

  scope :popular, lambda { |limit| order(:tags_count).reverse_order.limit(limit) }

  scope :suggest, lambda { |prefix| where("key like ?", "%#{prefix}%") }

end

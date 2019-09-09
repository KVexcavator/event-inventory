class Event < ApplicationRecord
  belongs_to :user, inverse_of: 'organized_events'

  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :title, use: :slugged

  # create tag list
  def all_tags=(names)
    self.tags = names.split(",").map do |t|
      Tag.where(name: t.strip).first_or_create!
    end
  end
  # show tag list
  def all_tags
    tags.map(&:name).join(", ")
  end
end

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
  # search the tagged events
  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end
  # count the number of tags associated with all the events
  def self.tag_counts
    Tag.select("tags.name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
  # find the event owner
  def self.event_owner(user_id)
    User.find_by id: user_id
  end
end

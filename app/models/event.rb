class Event < ApplicationRecord
  belongs_to :user, inverse_of: 'organized_events'

  extend FriendlyId
  friendly_id :title, use: :slugged
end

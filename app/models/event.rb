class Event < ApplicationRecord
  belongs_to :user, inverse_of: :organized_events
end

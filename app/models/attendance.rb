class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # create attendance and pass event ID and user ID as params
  def self.join_event(user_id, event_id, state)
    self.create(user_id: user_id, event_id: event_id, state: state)
  end
end

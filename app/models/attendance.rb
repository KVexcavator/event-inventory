class Attendance < ApplicationRecord
  # add workflow state
  include WorkflowActiverecord
  workflow_column :workflow_state
  workflow do
    state :request_sent do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end
  
  belongs_to :event
  belongs_to :user

  # create attendance and pass event ID and user ID as params
  def self.join_event(user_id, event_id, workflow_state)
    self.create(user_id: user_id, event_id: event_id, workflow_state: workflow_state)
  end

end

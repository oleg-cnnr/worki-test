class Address < ApplicationRecord
  include AASM

  belongs_to :task

  aasm column: :state do
    state :awaiting, initial: true
    state :completed, :failed

    event :complete do
      transitions from: :awaiting, to: :completed
    end

    event :fail do
      transitions from: :awaiting, to: :failed
    end
  end
end

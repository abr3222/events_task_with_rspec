# frozen_string_literal: true

class Event < ApplicationRecord
  # TODO: implement validations and kind of events
  enum kind: ['in', 'out']
  validates :kind, inclusion: { in: kinds.keys }

  validates :employee_id, presence: true
  validates :kind, presence: true
  validates :timestamp, presence: true
end

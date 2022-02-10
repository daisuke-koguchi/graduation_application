class Schedule < ApplicationRecord
  belongs_to :exercise

  def self.ransackable_attributes(auth_object = nil)
    %w(fixed_day is_done)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id 
  def message_time
    weeks = ["日", "月", "火", "水", "木","金", "土"]
    week = weeks[created_at.wday]
    created_at.strftime("%m年%d月%y日 (#{week}) %l:%M")
  end
end

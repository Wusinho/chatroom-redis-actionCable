class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  validates :content, presence: true

end

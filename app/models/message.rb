class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :author, class_name: 'User', foreign_key: :user_id

end

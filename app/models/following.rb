class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_user, class_name: 'User'

  validates :user_id, uniqueness: { scope: :following_user_id }
end

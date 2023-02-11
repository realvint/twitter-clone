class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_user, class_name: 'User'
end

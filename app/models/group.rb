class Group < ApplicationRecord
  has_many :activities, class_name: 'Activity', foreign_key: :activity_id
  has_one_attached :icon
end

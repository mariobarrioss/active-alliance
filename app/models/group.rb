class Group < ApplicationRecord
  has_many :activities, class_name: 'Activity', foreign_key: :activity_id
end

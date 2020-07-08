class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :group, foreign_key: :group_id
end

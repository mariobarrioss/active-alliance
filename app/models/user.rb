class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, foreign_key: :author_id

  def personal_activities
    activities.where.not(group_id: nil)
  end

  def external_activities
    activities.where(group_id: nil)
  end
end

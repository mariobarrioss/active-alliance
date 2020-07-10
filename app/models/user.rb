class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :username, presence: true, length: { maximum: 20 }

  has_many :activities, foreign_key: :author_id
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def personal_activities
    activities.most_recent.where.not(group_id: nil)
  end

  def external_activities
    activities.most_recent.where(group_id: nil)
  end
end

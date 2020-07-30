class Group < ApplicationRecord
  after_commit :add_default_icon, on: [:create]

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 75 }
  validates :icon, presence: true,
                   content_type: { in: %w[image/jpeg image/gif image/png],
                                   message: 'must be a valid image format' },
                   size: { less_than: 5.megabytes,
                           message: 'should be less than 5MB' }

  has_many :group_activities
  has_many :activities, through: :group_activities
  has_one_attached :icon
  belongs_to :user

  scope :alphabetical, -> { order(:name) }

  def display_icon
    icon.variant(resize: '400x400')
  end

  private

  def add_default_icon
    return if icon.attached?

    icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')), filename: 'default.png',
                content_type: 'image/png')
  end
end

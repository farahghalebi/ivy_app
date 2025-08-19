class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :perfume
  validates :title, presence: true

end

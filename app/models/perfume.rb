class Perfume < ApplicationRecord
  has_many :chats, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end

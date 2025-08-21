class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :perfume
  mas_many :messages, dependent: :destroy 
  validates :title, presence: true
end

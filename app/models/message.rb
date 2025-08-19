class Message < ApplicationRecord
  belongs_to :chat
  ROLES = %w[user assistant system].freeze
  validates :chat, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validates :role, presence: true, inclusion: { in: ROLES }
end

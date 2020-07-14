class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  scope :recent, -> { order(:created_at).last(10) }
  # Ex:- scope :active, -> {where(:active => true)}
end

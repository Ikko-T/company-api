class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  enum gender: {
    male: 0,
    female: 1,
    not_sure: 2,
  }

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0}
  validates :company, length: { maximum: 50 }
  validates :twitter, length: { maximum: 50 }
  validates :message, length: { maximum: 2000 }
  validates :gender, numericality: true
end

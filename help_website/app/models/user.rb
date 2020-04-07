class User < ApplicationRecord
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :numberOfFamilyMembers, presence: true
  validates :region, presence: true

end

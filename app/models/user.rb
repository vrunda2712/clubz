class User < ApplicationRecord
  has_secure_password

  has_many :clubs

  validates :name, presence: true, uniqueness: true

  ALLOWED_ROLES = ["wizard","hobiit"]
end

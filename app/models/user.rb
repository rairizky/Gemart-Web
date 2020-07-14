class User < ApplicationRecord

    has_secure_password

    belongs_to :role

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }
    validates :role_id, presence: true
end

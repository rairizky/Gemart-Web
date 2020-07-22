class User < ApplicationRecord

    has_secure_password

    belongs_to :role
    has_one :profile
    has_many :suppliers
    has_many :gerais

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }
    validates :role_id, presence: true
end

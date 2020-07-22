class Gerai < ApplicationRecord

    belongs_to :user
    belongs_to :category

    mount_uploader :image, AvageraiUploader
    validates :name, presence: true
    validates :owner, presence: true
    validates :address, presence: true
    validates :lat, presence: true
    validates :long, presence: true
end

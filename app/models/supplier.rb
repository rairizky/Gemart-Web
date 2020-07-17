class Supplier < ApplicationRecord

    belongs_to :user
    belongs_to :category

    mount_uploader :image, AvasupplierUploader
    validates :name, presence: true
    validates :owner, presence: true
    validates :address, presence: true
    validates :lat, presence: true
    validates :long, presence: true
end

class Profile < ApplicationRecord

    belongs_to :user

    mount_uploader :image, AvaprofileUploader
    validates :dob, presence: true
    validates :gender, presence: true
    validates :phone, presence: true
    validates :address, presence: true
end

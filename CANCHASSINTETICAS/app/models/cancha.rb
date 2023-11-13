class Cancha < ApplicationRecord
    has_many :reservas
    has_and_belongs_to_many :usuarios

    mount_uploader :image, ImageUploader
end

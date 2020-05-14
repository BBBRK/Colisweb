class Carrier < ActiveRecord::Base
    include ActiveModel::Validations

    belongs_to :transporter

    validates :name, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :altitude, presence: true

    before_save :checkLicence

    #check la validité d'au moins un des permis
    def checkLicence
        if self.has_driver_licence_a == true || self.has_driver_licence_b == true || self.has_driver_licence_c == true
            return true
        else
            return false
        end
    end
end

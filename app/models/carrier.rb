class Carrier < ActiveRecord::Base
    include ActiveModel::Validations

    belongs_to :transporter

    validates :name, presence: true

    # validates :has_driver_licence_a, inclusion: { in: [true, false] }
    # validates :has_driver_licence_b, inclusion: { in: [true, false] }
    # validates :has_driver_licence_c, inclusion: { in: [true, false] }


    before_save :checkLicence

    def checkLicence
        if self.has_driver_licence_a == true || self.has_driver_licence_b == true || self.has_driver_licence_c == true
            return true
        else
            return false
        end
    end
end

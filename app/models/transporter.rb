class Transporter < ActiveRecord::Base

    serialize :postal_codes, Array
    serialize :carriers, Array

    validates :name, presence: true
    validates :siret, presence: true, uniqueness: true
    validates :postal_codes, presence: true
    validates :carriers, presence: true

end

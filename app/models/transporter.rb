class Transporter < ActiveRecord::Base

    serialize :postal_codes, Array
end

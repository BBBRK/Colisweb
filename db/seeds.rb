# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


transporter = Transporter.new(
    name: "test1",
    siret: "SIRET123456",
    postal_codes: ["02100", "02230", "02145"]
)

transporter.save!
p "la seed est bien passée"

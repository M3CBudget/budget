# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# t.string :name
# t.binary :logo
vendor_list = [
    [ "Rewe"],
    [ "Aldi Süd" ],
    [ "Aldi Nord" ],
    [ "EDEKA"],
    [ "Sport Verein"],
    [ "Vermieter"]
]

# Account
# t.string :number
# t.string :bic
# t.string :name
# t.boolean :active
# t.references :user, index: true
account_list = [
    [ 123456789, 12345, "Sparkasse", true, 1],
    [ 0, 0, "Bar", true, 1],
    [ 987654321, 54321, "Sparkonto", true, 1]
]


# Categorie
# t.string :name
# t.string :notice
# t.boolean :active
# t.boolean :income
# t.timestamps
category_list = [
    # Ausgaben
    ["Haushalt", "Diese Kategorie ist für Haushalt", true, false],
    ["Sport", "Diese Kategorie ist für Sport", true, false],
    ["Lebensmittel", "Diese Kategorie ist für Lebensmittel", true, false],
    ["Sprit", "Diese Kategorie ist für Sprit", true, false],
    ["Drogerie", "Diese Kategorie ist für Drogerie", true, false],
    ["Sonstiges", "Diese Kategorie ist für Sonstiges", true, false],

    # Einnahmen
    ["Gehalt", "Diese Kategorie ist für Gehalt", true, true],
    ["Geschenk", "Diese Kategorie ist für Geschenke", true, true],
    ["Sonstiges", "Diese Kategorie ist für Sonstiges", true, true]
]

# has_many :baskets
# has_many :accounts
# has_many :items
# attr_accessor :email
# t.string :email,              null: false, default: ""
# t.string :encrypted_password, null: false, default: ""
# first_name
# last_name
user_list = [
  ["test@testmail.com", "test1234", "otto", "test"],
  ["markw@gmail.de", "marktest", "mark", "warne"]
]


user_list.each do |user|
  User.create ( :email => user[0], :encrypted_password => user[1], :first_name => user[3], :last_name => user[4]  )
end

vendor_list.each do |vendor|
  Vendor.create ( :name => vendor[0] )
end

account_list.each do |account|
  Account.create ( :number => account[0], :bic => account[1], :name => account[2], :active => account[3], :user_id => account[4] )
end

category_list.each do |category|
  Category.create ( :name => category[0], :notice => category[1] , :active => category[2], :income => category[3])
end

user_list.each do |user|
  User.create ( :name => user[0] )
end
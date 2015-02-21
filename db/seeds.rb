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

# t.references :basket, index: true
# t.references :category, index: true
# t.references :article, index: true
# t.references :user, index: true
# t.string :name
# t.decimal :quantity
# t.decimal :price
# t.string :notice
# t.boolean :income
# t.integer :period
# t.date :launch
# t.date :finish
item_list_rewe = [
    # [Name, Quantity, Price, Category]
    ["Quark", 2, 0.59, 3],
    ["Milch", 1, 0.79, 3],
    ["Bananen", 5, 1.99, 3]
]

# t.string :notice
# t.decimal :amount
# t.binary :document
# t.references :user, index: true
# t.references :payment, index: true
# t.references :vendor, index: true

# validates :amount, :user_id, :vendor_id, presence: true
# validates :amount, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
basket_list = [
    ["Notiz 1", 3.37, 1, 1, 1]
]

user_list.each do |user|
  User.create ( :email => user[0], :encrypted_password => user[1], :first_name => user[2], :last_name => user[3]  )
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

basket_list.each do |basket|
  Basket.create ( :notice => basket[0], :amount => basket[1] , :user => basket[2], :payment => basket[3], :vendor => basket[4])
end

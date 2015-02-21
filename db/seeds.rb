# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Vendor
Vendor.create!([  {name: 'Aldi'},
                  {name: 'REWE'},
                  {name: 'EDEKA'},
                  {name: 'Sport Verein'},
                  {name: 'Vermieter'},
                  {name: 'Westfalen Gas'},
                  {name: 'Amazon'}
               ])



# Account
Account.create!([  {name: 'Sparkasse', number:'1634001234', bic:'26550150', active:true, user_id:1},
                   {name: 'Volksbank IBAN', number:'AL90208110080000001039531801', bic:'AL9020811008', active:true, user_id:2},
                   {name: 'Barzahlung', number:'0', bic:'0', active:true, user_id:1}
                ])

# Category
Category.create!([  {name: 'Haushalt', notice:'Kategorie für Haushalt', active:'true', income:'false'},
                    {name: 'Sport', notice:'Kategorie für Sport', active:'true', income:'false'},
                    {name: 'Sprit', notice:'Kategorie für Sprit', active:'true', income:'false'},
                    {name: 'Drogerie', notice:'Kategorie für Drogerie', active:'true', income:'false'},
                    {name: 'Sonstige', notice:'Kategorie für Sonstige Dinge', active:'true', income:'false'},
                    {name: 'Geschenk', notice:'Einnahmen durch Geschenke', active:'true', income:'true'},
                    {name: 'Gehalt', notice:'Einnahmen durch Gehälter', active:'true', income:'true'},
                    {name: 'Gewinne', notice:'Einnahmen durch Gewinne', active:'true', income:'true'},
                    {name: 'Sonstige', notice:'Sonstige Einnahmen', active:'true', income:'true'},
                ])

User.create!([    { email: '0123456@web.de', password:'12345678', first_name:'Günther', last_name:'Gurke'},
                  { email: 'd.duese@web.de', password:'12345678', first_name:'Daniel', last_name:'Düsentrieb'},
             ])


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

#user_list.each do |user|
#  User.create( :email => user[0], :encrypted_password => user[1], :first_name => user[2], :last_name => user[3]  )
#end



#vendor_list.each do |vendor|
#  Vendor.create ( :name => vendor[0] )
#end

#account_list.each do |account|
#  Account.create ( :number => account[0], :bic => account[1], :name => account[2], :active => account[3], :user_id => account[4] )
#end

#category_list.each do |category|
#  Category.create ( :name => category[0], :notice => category[1] , :active => category[2], :income => category[3])
#end

#basket_list.each do |basket|
#  Basket.create ( :notice => basket[0], :amount => basket[1] , :user => basket[2], :payment => basket[3], :vendor => basket[4])
#end


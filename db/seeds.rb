# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Vendor.create!([  {name: 'Aldi'},
                  {name: 'REWE'},
                  {name: 'EDEKA'},
                  {name: 'Sport Verein'},
                  {name: 'Vermieter'},
                  {name: 'Westfalen Gas'},
                  {name: 'Amazon'}
               ])

Payment.create!([  {name: 'Sparkasse', number:'1634001234', bic:'26550150', active:true, user_id:1},
                   {name: 'Volksbank IBAN', number:'AL90208110080000001039531801', bic:'AL9020811008', active:true, user_id:2},
                   {name: 'Barzahlung', number:'0', bic:'0', active:true, user_id:1}
                ])

Category.create!([  {name: 'Haushalt', notice:'Kategorie für Haushalt', active:'true', income:'false'},
                    {name: 'Sport', notice:'Kategorie für Sport', active:'true', income:'false'},
                    {name: 'Sprit', notice:'Kategorie für Sprit', active:'true', income:'false'},
                    {name: 'Drogerie', notice:'Kategorie für Drogerie', active:'true', income:'false'},
                    {name: 'Sonstige', notice:'Kategorie für Sonstige Dinge', active:'true', income:'false'},
                    {name: 'Geschenk', notice:'Einnahmen durch Geschenke', active:'true', income:'true'},
                    {name: 'Gehalt', notice:'Einnahmen durch Gehälter', active:'true', income:'true'},
                    {name: 'Gewinne', notice:'Einnahmen durch Gewinne', active:'true', income:'true'},
                    {name: 'Sonstige', notice:'Sonstige Einnahmen', active:'true', income:'true'}
                ])

User.create!([    { email: '0@web.de', password:'12345678', first_name:'Günther', last_name:'Gurke'},
                  { email: 'd.duese@web.de', password:'12345678', first_name:'Daniel', last_name:'Düsentrieb'},
                  { email: 'otto@test.de', password:'ottotest', first_name:'Otto', last_name:'Test'}
             ])


Item.create!([
                 {basket_id: 1, category_id: 1, user_id: 1, name: 'Quark', quantity:5, price:0.99, notice: 'Quark für Mark', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 1, category_id: 1, user_id: 1, name: 'Bier', quantity:1, price:4.20, notice: '', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 1, category_id: 1, user_id: 1, name: 'Parmesan', quantity:2, price:3.99, notice: '', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 1, category_id: 1, user_id: 1, name: 'WC Reiniger', quantity:1, price:0.79, notice: '', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 1, category_id: 4, user_id: 1, name: 'Deo Axe', quantity:1, price:3.89, notice: 'wird auch immer teurer', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 2, category_id: 3, user_id: 1, name: 'Super E10', quantity:42, price:1.29, notice: 'Tour Osnabrück - Münster', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 3, category_id: 2, user_id: 1, name: 'Tischtennis Bälle', quantity:10, price:1.00, notice: '', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 3, category_id: 2, user_id: 1, name: 'Tischtennis Schläger', quantity:2, price:34.99, notice: '', income: false, launch: Time.now.to_formatted_s(:db)},
                 {basket_id: 4, category_id: 5, user_id: 2, name: 'Lotto', quantity:1, price:53.80, notice: 'Diesmal gewinn ich!', income: false, launch: Time.now.to_formatted_s(:db)},
                 {category_id: 6, user_id: 1, name: 'Weihnachten Oma', quantity:1, price:50.80, notice: 'Omi ist die Beste', income: true, launch: Time.now.to_formatted_s(:db)},
                 {category_id: 7, user_id: 1, name: 'Gehalt', quantity:1, price:2000.80, notice: 'FH Münster', income: true, launch: Time.now.to_formatted_s(:db)}
             ])

Basket.create!([
                   {notice: '', amount: 100, vendor_id: 1, user_id: 1, payment_id: 3},
                   {notice: '', amount: 50, vendor_id: 6, user_id: 1, payment_id: 1},
                   {notice: '', amount: 100, vendor_id: 4, user_id: 1, payment_id: 3},
                   {notice: '', amount: 53.80, vendor_id: 2, user_id: 2, payment_id: 2}

               ])



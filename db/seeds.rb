User.create!([
  {email: "d.duese@web.de", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "Daniel", last_name: "Düsentrieb"},
  {email: "otto@test.de", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "Otto", last_name: "Test"},
  {email: "0@web.de", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-22 19:23:28", last_sign_in_at: "2015-02-22 19:23:28", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "Günther", last_name: "Gurke"}
])
Basket.create!([
  {notice: "", amount: "100.0", document: nil, user_id: 1, payment_id: 3, vendor_id: 1, purchase_date: "2015-02-12"},
  {notice: "", amount: "50.0", document: nil, user_id: 1, payment_id: 1, vendor_id: 6, purchase_date: "2015-01-12"},
  {notice: "", amount: "100.0", document: nil, user_id: 1, payment_id: 3, vendor_id: 4, purchase_date: "2014-12-12"},
  {notice: "", amount: "53.8", document: nil, user_id: 2, payment_id: 2, vendor_id: 2, purchase_date: "2015-02-12"}
])
Category.create!([
  {name: "Haushalt", notice: "Kategorie für Haushalt", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Sport", notice: "Kategorie für Sport", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Sprit", notice: "Kategorie für Sprit", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Drogerie", notice: "Kategorie für Drogerie", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Sonstige", notice: "Kategorie für Sonstige Dinge", active: true, income: false, user_id: 2, glyphicon_id: nil},
  {name: "Geschenk", notice: "Einnahmen durch Geschenke", active: true, income: true, user_id: 1, glyphicon_id: nil},
  {name: "Gehalt", notice: "Einnahmen durch Gehälter", active: true, income: true, user_id: 1, glyphicon_id: nil},
  {name: "Gewinne", notice: "Einnahmen durch Gewinne", active: true, income: true, user_id: 2, glyphicon_id: nil},
  {name: "Sonstige", notice: "Sonstige Einnahmen", active: true, income: true, user_id: 1, glyphicon_id: nil},
  {name: "Party", notice: "Kategorie für Party", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Flohmarkt", notice: "Kategorie für Einnahmen von Verkäufen", active: true, income: true, user_id: 1, glyphicon_id: nil},
  {name: "WG", notice: "Kategorie für den WG Bedarf", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Versicherung", notice: "Kategorie für Versicherungen", active: true, income: false, user_id: 1, glyphicon_id: nil},
  {name: "Steuerrückzahlung", notice: "Kategorie für Steuerrückzahlungen", active: true, income: true, user_id: 1, glyphicon_id: nil},
  {name: "Lebensmittel", notice: "Kategorie für Ausgaben für Lebensmittel", active: true, income: false, user_id: 1, glyphicon_id: nil}
])
Item.create!([
  {basket_id: 1, category_id: 1, article_id: nil, user_id: 1, name: "Quark", quantity: "5.0", price: "0.99", notice: "Quark für Mark", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 1, category_id: 1, article_id: nil, user_id: 1, name: "Bier", quantity: "1.0", price: "4.2", notice: "", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 1, category_id: 1, article_id: nil, user_id: 1, name: "Parmesan", quantity: "2.0", price: "3.99", notice: "", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 1, category_id: 1, article_id: nil, user_id: 1, name: "WC Reiniger", quantity: "1.0", price: "0.79", notice: "", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 1, category_id: 4, article_id: nil, user_id: 1, name: "Deo Axe", quantity: "1.0", price: "3.89", notice: "wird auch immer teurer", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 2, category_id: 3, article_id: nil, user_id: 1, name: "Super E10", quantity: "42.0", price: "1.29", notice: "Tour Osnabrück - Münster", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 3, category_id: 2, article_id: nil, user_id: 1, name: "Tischtennis Bälle", quantity: "10.0", price: "1.0", notice: "", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 3, category_id: 2, article_id: nil, user_id: 1, name: "Tischtennis Schläger", quantity: "2.0", price: "34.99", notice: "", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: 4, category_id: 5, article_id: nil, user_id: 2, name: "Lotto", quantity: "1.0", price: "53.8", notice: "Diesmal gewinn ich!", income: false, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: nil, category_id: 6, article_id: nil, user_id: 1, name: "Weihnachten Oma", quantity: "1.0", price: "50.8", notice: "Omi ist die Beste", income: true, period: nil, launch: "2015-02-22", finish: nil, period_id: nil},
  {basket_id: nil, category_id: 7, article_id: nil, user_id: 1, name: "Gehalt", quantity: "1.0", price: "2000.8", notice: "FH Münster", income: true, period: nil, launch: "2015-02-22", finish: nil, period_id: nil}
])
Payment.create!([
  {user_id: 1, number: "1634001234", bic: "26550150", active: true, name: "Sparkasse"},
  {user_id: 2, number: "AL90208110080000001039531801", bic: "AL9020811008", active: true, name: "Volksbank IBAN"},
  {user_id: 1, number: "0", bic: "0", active: true, name: "Barzahlung"},
  {user_id: 1, number: "DE123456789123456789", bic: "BIC123456", active: true, name: "Deutsche Bank"},
  {user_id: 1, number: "DE12345612345", bic: "BIC7654321", active: true, name: "Commerzbank"},
  {user_id: 2, number: "DE123456789123456789", bic: "BIC123456", active: true, name: "Deutsche Bank"},
  {user_id: 2, number: "DE12345612345", bic: "BIC7654321", active: true, name: "Commerzbank"}
])
Vendor.create!([
  {name: "Aldi", logo: nil, user_id: 1},
  {name: "REWE", logo: nil, user_id: 2},
  {name: "EDEKA", logo: nil, user_id: 1},
  {name: "Sport Verein", logo: nil, user_id: 1},
  {name: "Vermieter", logo: nil, user_id: 1},
  {name: "Westfalen Gas", logo: nil, user_id: 1},
  {name: "Amazon", logo: nil, user_id: 1},
  {name: "Kaufpark", logo: nil, user_id: 2},
  {name: "Kaufpark", logo: nil, user_id: 1}
])

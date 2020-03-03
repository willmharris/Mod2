DatabaseCleaner.clean_with(:truncation)

Dm.create(name: "Will", password: "123", email: "willemail@gmail.com")
Dm.create(name: "Bob", password: "123", email: "bobemail@gmail.com")
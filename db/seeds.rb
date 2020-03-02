DatabaseCleaner.clean_with(:truncation)

Dm.create(name: "Will")
Dm.create(name: "Bob")
Monster.create(name: "Orc")
Monster.create(name: "Kobold")
Monster.create(name: "Goblin")
DatabaseCleaner.clean_with(:truncation)

Dm.create(name: "Will", password: "123", email: "willmharris0@gmail.com")
Dm.create(name: "Bob", password: "123", email: "bobisgreat@gmail.com")
Dm.create(name: "Wesley", password: "123", email: "bestemail@gmail.com")
Monster.create(name: "Goblin", popularity: 0, creator_id: 1, size: "Small", category: "Humanoid", alignment: "Neutral evil", ac: 15, hp: 7, speed: 30, strength: 8, dexterity: 14, constitution: 10, intelligence: 10, wisdom: 8, charisma: 8, cr: 1, image: "https://i.pinimg.com/originals/b4/74/9a/b4749aa294065dcf812f68f5f27fb46b.png" )
DmMonster.create(dm_id: 1, monster_id: 1)
Action.create(monster_id: 1, name: "Scimitar", description: "Melee Weapon Attack: +4 to hit, reach 5 ft., one target. Hit: (1d6 + 2) slashing damage.")
Action.create(monster_id: 1, name: "Shortbow", description: "Ranged Weapon Attack: +4 to hit, reach 80/320 ft., one target. Hit: (1d6 + 2) piercing damage.")
Monster.create(name: "Gelatinous Cube", popularity: 0, creator_id: 2, size: "Large", category: "Ooze", alignment: "True Neutral", ac: 6, hp: 84, speed: 15, strength: 14, dexterity: 3, constitution: 20, intelligence: 1, wisdom: 6, charisma: 1, cr: 4, image: "https://i.pinimg.com/originals/18/91/79/1891796fe982cb05f1dc64579123981c.jpg" )
DmMonster.create(dm_id: 2, monster_id: 2)
Action.create(monster_id: 2, name: "Pseudopod", description: "Melee Weapon Attack: +4 to hit, reach 5 ft., one creature. Hit: (3d6) acid damage.")
Action.create(monster_id: 2, name: "Engulf", description: "The cube moves up to its speed. While doing so, it can enter Large or smaller creatures' spaces. Whenever the cube enters a creature's space, the creature must make a DC 12 Dexterity saving throw. On a successful save, the creature can choose to be pushed 5 feet back or to the side of the cube. A creature that chooses not to be pushed suffers the consequences of a failed saving throw. On a failed save, the cube enters the creature's space, and the creature takes 10 (3d6) acid damage and is engulfed. The engulfed creature can't breathe, is restrained, and takes 21 (6d6) acid damage at the start of each of the cube's turns. When the cube moves, the engulfed creature moves with it. An engulfed creature can try to escape by taking an action to make a DC 12 Strength check. On a success, the creature escapes and enters a space of its choice within 5 feet of the cube.")
Monster.create(name: "Adult Red Dragon", popularity: 0, creator_id: 1, size: "Huge", category: "Dragon", alignment: "Chaotic Evil", ac: 19, hp: 256, speed: 40, strength: 27, dexterity: 10, constitution: 25, intelligence: 16, wisdom: 13, charisma: 21, cr: 17, image: "https://i.ytimg.com/vi/VMJXoZWr3Uk/maxresdefault.jpg" )
DmMonster.create(dm_id: 1, monster_id: 3)
Action.create(monster_id: 3, name: "Multiattack", description: "The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.")
Action.create(monster_id: 3, name: "Bite", description: "Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: (2d10 + 8) piercing damage plus (2d6)fire damage.")
Action.create(monster_id: 3, name: "Claw", description: "Melee Weapon Attack: +14 to hit, reach 5 ft., one target. Hit: (2d6 + 8) slashing damage.")
Action.create(monster_id: 3, name: "Tail", description: "Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: (2d8 + 8) bludgeoning damage.")
Action.create(monster_id: 3, name: "Frightful Presence", description: "Each creature of the dragon's choice that is within 120 ft. of the dragon and aware of it must succeed on a DC 19 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature's saving throw is successful or the effect ends for it, the creature is immune to the dragon's Frightful Presence for the next 24 hours.")
Action.create(monster_id: 3, name: "Fire Breath", description: "The dragon exhales fire in a 60-foot cone. Each creature in that area must make a DC 21 Dexterity saving throw, taking 63 (18d6) fire damage on a failed save, or half as much damage on a successful one.")
Monster.create(name: "Big Boy: The Chicken", creator_id: 3, size: "Gargantuan", category: "Beast", alignment: "Chaotic Evil", ac: 10, hp: 15, speed: 3, strength: 10, dexterity: 10, constitution: 5, intelligence: 0, wisdom: 0, charisma: 30, cr: 1, image: "https://i.pinimg.com/564x/c0/e7/e7/c0e7e7cf5202ef4dfe584cae920aa6f2.jpg", popularity: 2)
DmMonster.create(dm_id: 1, monster_id: 4)
DmMonster.create(dm_id: 2, monster_id: 4)
DmMonster.create(dm_id: 3, monster_id: 4)
Action.create(monster_id: 4, name: "Peck", description: "Destroys a skyscraper.")
Action.create(monster_id: 4, name: "Lay Egg", description: "Prepares an egg." )
Action.create(monster_id: 4, name: "Egg Hatch", description: "Creates a small boy." )


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create({ username: Faker::DragonBall.character, password: "1", email: "test@email.com" })
end

Family.create(name:"Brass")
Family.create(name:"Strings")
Family.create(name:"Woodwind")
Family.create(name:"Percussion")
Family.create(name:"Keyboard")
Family.create(name:"Vocal")

Ensemble.create(name:"Z-Fighters", host_id: 1)
Ensemble.create(name:"Baby Makers", host_id: 4)
Ensemble.create(name:"Hot Spoons", host_id: 1)
Ensemble.create(name:"Take Flight", host_id: 7)
Ensemble.create(name:"Abedo", host_id: 5)
Ensemble.create(name:"Crusty Bucket", host_id: 3)

Instrument.create(name:"Guitar", family_id: 2)
Instrument.create(name:"Violin", family_id: 2)
Instrument.create(name:"Drums", family_id: 4)
Instrument.create(name:"Piano", family_id: 5)
Instrument.create(name:"Vocal Soprano", family_id: 6)
Instrument.create(name:"Vocal Tenor", family_id: 6)
Instrument.create(name:"Vocal Baritone", family_id: 6)

UserInstrument.create(user_id: 1, instrument_id: 1)
UserInstrument.create(user_id: 2, instrument_id: 6)
UserInstrument.create(user_id: 3, instrument_id: 2)
UserInstrument.create(user_id: 4, instrument_id: 2)
UserInstrument.create(user_id: 5, instrument_id: 4)
UserInstrument.create(user_id: 6, instrument_id: 5)
UserInstrument.create(user_id: 7, instrument_id: 1)
UserInstrument.create(user_id: 8, instrument_id: 7)
UserInstrument.create(user_id: 9, instrument_id: 3)
UserInstrument.create(user_id: 10, instrument_id: 1)

UserEnsemble.create(user_id: 1, ensemble_id: 1)
UserEnsemble.create(user_id: 2, ensemble_id: 6)
UserEnsemble.create(user_id: 3, ensemble_id: 1)
UserEnsemble.create(user_id: 4, ensemble_id: 3)
UserEnsemble.create(user_id: 5, ensemble_id: 4)
UserEnsemble.create(user_id: 6, ensemble_id: 4)
UserEnsemble.create(user_id: 7, ensemble_id: 1)
UserEnsemble.create(user_id: 8, ensemble_id: 7)
UserEnsemble.create(user_id: 9, ensemble_id: 3)
UserEnsemble.create(user_id: 10, ensemble_id: 7)

Message.create(sender_id:5,receiver_id:1,message_body:"Nice set dude!")
Message.create(sender_id:7,receiver_id:1,message_body:"It was nice meeting you!")
Message.create(sender_id:1,receiver_id:4,message_body:"Hope to see you play again!")
Message.create(sender_id:2,receiver_id:6,message_body:"Hey, can I join your group?")
Message.create(sender_id:2,receiver_id:1,message_body:"HIIIIIIII")
Message.create(sender_id:7,receiver_id:8,message_body:"Nice set dude!")
Message.create(sender_id:3,receiver_id:1,message_body:"I'm hungry")

Fan.create(followed_id: 1, follower_id: 3)
Fan.create(followed_id: 1, follower_id: 2)
Fan.create(followed_id: 1, follower_id: 7)
Fan.create(followed_id: 1, follower_id: 5)
Fan.create(followed_id: 4, follower_id: 6)
Fan.create(followed_id: 7, follower_id: 1)
Fan.create(followed_id: 9, follower_id: 1)
Fan.create(followed_id: 8, follower_id: 9)
Fan.create(followed_id: 10, follower_id: 2)
Fan.create(followed_id: 7, follower_id: 3)

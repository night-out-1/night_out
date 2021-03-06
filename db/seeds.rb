# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username: "Chris", email: "chris@chris.com", password: "password", postal_code: "19085", admin: false)

user2 = User.create(username: "Shawn", email: "shawn@shawn.com", password: "password", postal_code: "19341", admin: false)

user3 = User.create(username: "Constance", email: "constance@constance.com", password: "password", postal_code: "19119", admin: true)

user4 = User.create(username: "Emmett", email: "emmett@emmett.com", password: "password", postal_code: "19125", admin: false)

event1 = Event.create(name: "Let's Get a Drink!", time: "9pm", description: "It's a depressing week with the cold and the holidays being over.  Let's just get together for a drink at Tortilleria's and chill.", user_id: 1, creator: 1, location_name: "Tortilleria San Roman", location_photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/X9oI1Iz-xwClzzIHTSQlSA/ms.jpg", location_url: "https://www.yelp.com/biz/tortilleria-san-roman-philadelphia?adjust_creative=bdo9TqUzvSfofw8SE33K3A&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=bdo9TqUzvSfofw8SE33K3A", location_street_address: "951 S 9th St", location_city: "Philadelphia", location_postal_code: "19085", location_latitude: "39.9376373291016", location_longitude: "-75.1579818725586")

 event2 = Event.create(name: "I Gotta Eat", time: "7:30", description: "Hey, I've been wanting to try this restaurant and thought it might be fun to try it tonight.  I hear the appetizers are the bomb.", user_id: 1, creator: 1, location_name: "Vedge", location_photo_url: "https://s3-media2.fl.yelpcdn.com/bphoto/MqqazRrOnrg50CwcG_SzcQ/ms.jpg", location_url: "https://www.yelp.com/biz/vedge-philadelphia?adjust_creative=bdo9TqUzvSfofw8SE33K3A&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=bdo9TqUzvSfofw8SE33K3A", location_street_address: "1221 Locust St", location_city: "Philadelphia", location_postal_code: "19107", location_latitude: "39.9479310476302",  location_longitude: "-75.1614279836694")


 event3 = Event.create(name: "Happy Hour", time: "6:00", description: "I think the drinks are half price from five to seven, so how about a quick gathering for low-priced drinks and conversation.", user_id: 2, creator: 2, location_name: "The Pour House", location_photo_url: "https://s3-media3.fl.yelpcdn.com/bphoto/pq6_9mlWsCywahf2OvbAqg/ms.jpg", location_url: "https://www.yelp.com/biz/the-pour-house-exton?adjust_creative=bdo9TqUzvSfofw8SE33K3A&utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=bdo9TqUzvSfofw8SE33K3A", location_street_address: "116 N. Pottstown Pike", location_city: "Exton", location_postal_code: "19341", location_latitude: "40.029962", location_longitude: "-75.630607")

 event1.users.push(user1)
 event1.users.push(user2)
 event2.users.push(user1)
 event2.users.push(user2)
 event2.users.push(user4)
 event3.users.push(user1)
 event3.users.push(user2)
 event3.users.push(user4)

 comment1 = Comment.create(user_id: 1, event_id: 1, title: "Time Flexible", content: "If you want to do it a little later that works, too.", flagged: false)

 comment2 = Comment.create(user_id: 1, event_id: 2, title: "Ask for Susan", content: "When you get here, ask to be seated at the party in Susan's section.", flagged: false)

 comment3 = Comment.create(user_id: 2, event_id: 2, title: "Update", content: "...more specifically, if you ask the hostess upstairs to sit in the party in Susan's section, it will be easier to find us.", flagged: false)

 comment4 = Comment.create(user_id: 1, event_id: 3, title: "Timing", content: "I am planning on getting there at 5:30 right after work.", flagged: false)

 comment5 = Comment.create(user_id: 2, event_id: 3, title: "Re: Timing", content: "Would you like me to change the time of the event so others may show up earlier?", flagged: false)

 comment6 = Comment.create(user_id: 1, event_id: 3, title: "Re: Timing", content: "Yeah, that would be great because I will definitely be there at 530.", flagged: false)

 comment7 = Comment.create(user_id: 4, event_id: 3, title: "I HAET YOU", content: "AND I HAET THIS EVENT", flagged: false)

 comment8 = Comment.create(user_id: 4, event_id: 2, title: "YORE THE WORST", content: "WHY ARE YOU TERRIBLE NO ONE LIKES YOU", flagged: false)

  

 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
meetups = Meetup.create(
  [
    {
      name: 'Nous Parlons',
      location_name: 'La Maison Francaise',
      address: '33 Harrison Avenue',
      city: "Boston",
      state: "MA",
      zip: "02111",
      date: "Every Friday",
      time: "8pm",
      language: "French",
      description: "We are a fun-loving group of francophones who enjoy talking in
          the French language about French culture, cinema, literature, and above all, food.
          Come and enjoy a cocktail hour of cheese and wine followed by a course of savory
          southern cuisine",
      user_id: users[0].id
    },
    {
      name: 'Ein Bier Bitte',
      location_name: "Jacob Wirth's",
      address: '33 Harrison Avenue',
      city: "Boston",
      state: "MA",
      zip: "02111",
      date: "August 13, 2017",
      time: "8pm",
      language: "German",
      description: "Come to JW's and enjoy a night of yelling at the soccer match
      in German.  The food is great with a touch of Germany and the beer flows freely.
      After the match we will head out for a good old-fashioned pub crawl.",
      user_id: users[0].id
    },
    {
      name: 'Cine Club',
      location_name: "La Casa Espanol",
      address: '33 Harrison Avenue',
      city: "Boston",
      state: "MA",
      zip: "02111",
      date: "Every Tuesday",
      time: "6pm",
      language: "Spanish",
      description: "Our group meets after work on Wednesday to watch a Spanish
      language film and discuss it.  This week we will be watching Almodovar's
      'Volver'.",
      user_id: users[0].id
    },
    {
      name: "Russian Doctor's Association",
      location_name: "Offices of Ivan Popov",
      address: '33 Harrison Avenue',
      city: "Boston",
      state: "MA",
      zip: "02111",
      date: "Every Saturday",
      time: "6pm",
      language: "Russian",
      description: "This event is perfect for thos health care workers who need
      to learn Russian for their job.  The evening consists of a meet-and-greet
      over snacks of pickled vegetables and drinks, after which we turn to a more
      focused discussion of topics pertinent to the field.",
      user_id: users[0].id
    }
  ]
)

users = User.create(
[
    {
      first_name: "John",
      last_name: "Smith",
      screen_name: "john49",
      email: "test@test.com",
      password: "123456",
      location: "MA",
      language: "French"
    },
    {
      first_name: "Mary",
      last_name: "Jones",
      screen_name: "bubbles",
      email: "test1@test.com",
      password: "123456",
      location: "MA",
      language: "French"
    },
    {
      first_name: "Chris",
      last_name: "Edwards",
      screen_name: "cemoonboy",
      email: "test2@test.com",
      password: "123456",
      location: "MA",
      language: "French"
    }
  ]
)

posts = Post.create(
  [
    {
      user_id: users[0].id,
      meetup_id: meetups[2].id,
      body: "Gracias!  I had a great night and met some very cool people."

    }
  ]
)

memberships = Membership.create(
  [
    {
      user_id: users[0].id,
      meetup_id: meetups[2].id
    },
    {
      user_id: users[1].id,
      meetup_id: meetups[2].id
    },
    {
      user_id: users[2].id,
      meetup_id: meetups[2].id
    }
  ]
)

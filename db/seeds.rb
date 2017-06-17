Club.destroy_all
User.destroy_all

clubs = [
  {name: "The Green Dragon", description: "The place where the coolest vertically challenged citizens of Middle-Earth get loud and tell tall tales"},
  {name: "Cantina at Mos Eisley", description: "If you want to prove you can hang with scum and villainy's greatest hits, this is your joint"},
  {name: "The Hog's Head", description: "Aspiring wizards drink butterbeer here and host mind-numbing after parties"},
  {name: "The Babylon Club", description: "Say hello to your little friend, or other friends at this south Florida staple"}
]

clubs.each do |club|
  Club.create(club)
end

users = [
  {name: "frodo", password: "1234", password_confirmation: "1234"},
  {name: "c3p0", password: "1234", password_confirmation: "1234"},
  {name: "hermione", password: "1234", password_confirmation: "1234"},
  {name: "tony", password: "1234", password_confirmation: "1234"},
]

users.each do |user|
  User.create(user)
end

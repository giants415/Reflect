# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all
Post.destroy_all

user1 = User.create({username: "Andrew", email: "andrew@gmail.com", password: "password"})


p "Seeds have been run"

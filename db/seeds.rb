# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Which devices is the Oura ring compatible with?",
"Where can I download the Oura app?",
"How does Oura measure my heart rate?",
"Does Oura track my heart rate during exercise?",
"Can I wear the ring at the gym?",
"How does Oura track my heart rate variability?",
"How does Oura measure my body temperature?",
"Can I put the Oura ring in airplane mode?",
"The Oura ring and EMF",
"What's included in my ring order?",
"What’s Oura’s return policy?",
"How can I order a sizing kit?",
"How can I cancel my ring order?",
"Can I make changes to my ring order?",
"I'm having problems with my ring. Where can I find help?",
"Update The Shipping Address Of Your Order",
"Payment Issues",
"Shipping & Order FAQs",
"Countries We Ship To",
"Where to Purchase An Oura Ring",
"Missing Order Confirmation Email"].each do |title|
  Article.create!(title: title)
end

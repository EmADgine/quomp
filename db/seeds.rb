# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
["Marketing Strategy",
    "Email Marketing",
    "Paid Search",
    "Affiliate Marketing",
    "SEO",
    "Social Media"].each do |value|
    (1..5).each do |i|
        Skill.create!(name: value+"_Skill_"+i.to_s,strength: rand(0..11),discipline:value)
    end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
def get_idealattributes()
    ["attribute 1","attribute2","attribute3"]
end
def get_tasks_by_discipline(discipline)
    return ["task 1","task2","task3"]
end
def get_skills_by_discipline(discipline)

        map={"Email Marketing"=> ["MailChimp","ConstantContact","iContact","SendinBlue","BenchMark","ExactTarget","Responsesys","Silverpop","Marketo","Google Analytics","Microsoft Word","Microsoft Excel","Microsoft PowerPoint","HTML","Flash","CSS",".NET","PHP","SQL","Content Management Systems","Content Writing"],
            "SEO"=> ["Copywriting","Wordpress","Google Adwords", "Google Analytics","Conductor Searchlight", "Brightedge", "NetInsight","Omniture","WebTrends","ahrefs","BuzzStream","Moz","Majestic SEO","Wordtracker","Google Webmaster Tools", "Twitter","Facebook","Linkedin","Google+","Pinterest","Instagram","Yelp","Microsoft Word","Microsoft Excel","Microsoft PowerPoint","HTML","CSS","JavaScript","CC","Content Writing","Blog Writing","Blog Commenting","Article Writing","Article Submission","Backlinking","Keyword Research","Link Building","Social Bookmarking","Directory Submission","Site Architecture","Web Hosting","Server Side Configuration","Content Management Systems"],
            "Paid Search"=> ["Microsoft AdCenter","Yahoo Sponsored Search", "Google Webmaster Tools","DoubleClick","ClickPath","Atlas","Omniture","Marin","Kenshoo","ComScore","HitBox","AdGooroo","WordTracker","Microsoft Word", "Microsoft Excel","Microsoft PowerPoint","Google Analytics","Content Management Systems", "SQL","HTML","CSS","Google AdWords","Google AdWords API","Google ADSense","Yahoo Search Marketing","Bing Search Marketing", "Google Search Marketing", "MSN Search Marketing", "Ad Copy", "Landing Page Optimization","A/B Testing"],
            "Marketing Strategy"=>["Salesforce","NetSuite","OnContact","Act","InfusionSoft","RelateIQ","Google Analytics", "Financial Modeling & Valuation","Statistics","Corporate Strategy","Corporate Branding","Digital Media Planning", "Traditional Media Planning"],
            "Social Media"=> ["Profile Creation","Profile Management","Content Creation","Content Sourcing","Page Creation","Page Management","AD Creation","AD Campaign Management","Post Scheduling","Message Management","Engagement with Fans","Targeted Recruitment of New Fans","Bitly","HootSuite","Buffer","SocialOomph","TweetDeck","Sprout Social","Video Production","Video Editing"]
        }
        puts "--"+discipline+"--"
        puts map[discipline]
        return map[discipline]
    end



Skill.delete_all
Task.delete_all
Idealattribute.delete_all
["Marketing Strategy",
    "Email Marketing",
    "Paid Search",
    "SEO",
"Social Media"].each do |discipline|
    get_skills_by_discipline(discipline).each do |skill|
        Skill.create!(name: skill,strength: rand(0..11),discipline:discipline)
    end
    get_tasks_by_discipline(discipline).each do |task|
        Task.create!(name: task,discipline:discipline)
    end
end
get_idealattributes.each do |idealattribute|
    Idealattribute.create!(name: idealattribute)
end

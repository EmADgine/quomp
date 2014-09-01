# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#
ulysses="It little profits that an idle king,
By this still hearth, among these barren crags,
Match'd with an aged wife, I mete and dole
Unequal laws unto a savage race,
That hoard, and sleep, and feed, and know not me.
I cannot rest from travel: I will drink
Life to the lees: All times I have enjoy'd
Greatly, have suffer'd greatly, both with those
That loved me, and alone, on shore, and when
Thro' scudding drifts the rainy Hyades
Vext the dim sea: I am become a name;
For always roaming with a hungry heart
Much have I seen and known; cities of men
And manners, climates, councils, governments,
Myself not least, but honour'd of them all;
And drunk delight of battle with my peers,
Far on the ringing plains of windy Troy.
I am a part of all that I have met;
Yet all experience is an arch wherethro'
Gleams that untravell'd world whose margin fades
For ever and forever when I move.
How dull it is to pause, to make an end,
To rust unburnish'd, not to shine in use!
As tho' to breathe were life! Life piled on life
Were all too little, and of one to me
Little remains: but every hour is saved
From that eternal silence, something more,
A bringer of new things; and vile it were
For some three suns to store and hoard myself,
And this gray spirit yearning in desire
To follow knowledge like a sinking star,
Beyond the utmost bound of human thought.
This is my son, mine own Telemachus,
To whom I leave the sceptre and the isle,—
Well-loved of me, discerning to fulfil
This labour, by slow prudence to make mild
A rugged people, and thro' soft degrees
Subdue them to the useful and the good.
Most blameless is he, centred in the sphere
Of common duties, decent not to fail
In offices of tenderness, and pay
Meet adoration to my household gods,
When I am gone. He works his work, I mine.
There lies the port; the vessel puffs her sail:
There gloom the dark, broad seas. My mariners,
Souls that have toil'd, and wrought, and thought with me—
That ever with a frolic welcome took
The thunder and the sunshine, and opposed
Free hearts, free foreheads—you and I are old;
Old age hath yet his honour and his toil;
Death closes all: but something ere the end,
Some work of noble note, may yet be done,
Not unbecoming men that strove with Gods.
The lights begin to twinkle from the rocks:
The long day wanes: the slow moon climbs: the deep
Moans round with many voices. Come, my friends,
'Tis not too late to seek a newer world.
Push off, and sitting well in order smite
The sounding furrows; for my purpose holds
To sail beyond the sunset, and the baths
Of all the western stars, until I die.
It may be that the gulfs will wash us down:
It may be we shall touch the Happy Isles,
And see the great Achilles, whom we knew.
Tho' much is taken, much abides; and tho'
We are not now that strength which in old days
Moved earth and heaven, that which we are, we are;
One equal temper of heroic hearts,
Made weak by time and fate, but strong in will
To strive, to seek, to find, and not to yield."

def get_industries
    ['Basic Materials','Chemicals','Automotive','Food & Beverage','Personal & Household Goods','Media & Entertainment','Retail','Travel & Leisure','Banks','Financial Services','Insurance','Health Care','Construction & Materials','Industrial Goods & Services', 'Oil & Gas','Technology','Telecommunications','Utilities','Government']
end
def get_educations
    ['PhD','Master\'s','Bachelor\'s', 'High School Diploma']
end
def get_idealattributes()
    ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability"]
end
def get_tasks_by_discipline(discipline)
    map ={"Email Marketing"=> ["Email Design","Email Coding","Email Deliverability"],"SEO"=>["On Page Optimization","Off Page Optimization"],"Paid Search"=> ["Campaign Research", "Campaign Set-Up","Campaign Optimization","Content and Display","Retargeting"],"Marketing Strategy"=>["Marketing Plan Development","Business Plan Development","Market Research","Consulting"],"Social Media"=>["Facebook Management","Twitter Management","Linkedin Management","Pinterest Management","Google+ Management","Instagram Management","Youtube Management","Vine Management"]}
    return map[discipline]
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
disciplines=["Marketing Strategy",
    "Email Marketing",
    "Paid Search",
    "SEO",
    "Social Media"]
disciplines.each do |discipline|
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


Provider.delete_all
names=[["Charlie Brown","cb@gmail.com"], ["Peppermint Patty","pp@gmail.com"], ["Shermy","sherm@gmail.com"],["Snoopy","snoopy@gmail.com"],["Violet Gray","vg@gmail.com"],["Sally Brown","sb@gmail.com"], ["Linus","linus@gmail.com"],["Woodstock","woodstock@gmail.com"]]
cities="oxville cowville pigville sheepville donkeyville monkeyville houndville"
universities="Harvard Berkeley Princeton Yale Georgetown Brown Cornell Oxford Cambridge"
states="MD NJ TX CA KS OK CO NV NY MA"
def website(n)
    n.gsub(/\s+/,"").downcase+".com"
end
password="peanuts"
type="Provider"
ptypes= ["freelancer","agency"]
linkedin="linkedin.com"
times=["2000-01-01 5:00:00","2000-01-01 21:00:00"]
(0..100).each do |i|
    result_disciplines=[]
    num_disciplines=(1..5).to_a.sample
    disciplines=["Marketing Strategy","Email Marketing","Paid Search","SEO","Social Media"]
    for k in (1..num_disciplines)
        result_disciplines<< Discipline.new({:name=> disciplines.pop(),:years=>(1..15).to_a.sample,:description=>ulysses.split('.').sample})
    end
    info= names.sample
    puts info[1].split('@')*(i.to_s+'@')
    Provider.create! :name => info[0]+i.to_s,
        :email=>info[1].split('@')*(i.to_s+'@'),
        :city=>cities.split().sample,
        :state=>states.split().sample,
        :website=>website(info[0]),
        :password=>password,
        :password_confirmation=>password,
        :description=>ulysses.split('.').sample,
        :ptype=>ptypes.sample,
        :education=> get_educations.sample,
        :university=>universities.split().sample,
        :linkedin=>linkedin,
        :disciplines=>result_disciplines
end

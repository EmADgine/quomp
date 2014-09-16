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
require "csv"


ulysses="It little profits that an idle king,
By this still hearth, among these barren crags,
Match'd with an aged wife, I mete and dole
Unequal laws unto a savage race"

def get_industries
    ['Basic Materials','Chemicals','Automotive','Food & Beverage','Personal & Household Goods','Media & Entertainment','Retail','Travel & Leisure','Banks','Financial Services','Insurance','Health Care','Construction & Materials','Industrial Goods & Services', 'Oil & Gas','Technology','Telecommunications','Utilities','Government']
end
def get_educations
    ['PhD','Master\'s Degree','Bachelor\'s Degree', 'High School Diploma']
end
def get_idealattributes()
    ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability"]
end
def get_tasks_by_discipline(discipline)
    map ={"Email Marketing"=> ["Email Design","Email Coding","Email Deliverability"],"SEO"=>["On Page Optimization","Off Page Optimization"],"Paid Search"=> ["Campaign Research", "Campaign Set-Up","Campaign Optimization","Content and Display","Retargeting"],"Marketing Strategy"=>["Marketing Plan Development","Business Plan Development","Market Research","Consulting"],"Social Media"=>["Facebook Management","Twitter Management","Linkedin Management","Pinterest Management","Google+ Management","Instagram Management","Youtube Management","Vine Management"]}
    return map[discipline]
end
def get_skills_by_discipline(discipline)

    map={"Email Marketing"=> ["MailChimp","ConstantContact","iContact","SendinBlue","Benchmark","ExactTarget","Responsys","SilverPop","Marketo","Google Analytics","Microsoft Word","Microsoft Excel","Microsoft PowerPoint","HTML","Flash","CSS",".NET","PHP","SQL","Content Management Systems","Content Writing","Copywriting"],
        "SEO"=> ["Copywriting","Wordpress","Google Adwords", "Google Analytics","Conductor Searchlight", "Brightedge", "NetInsight","Omniture","WebTrends","ahrefs","BuzzStream","Moz","Majestic SEO","Wordtracker","Google Webmaster Tools", "Twitter","Facebook","LinkedIn","Google+","Pinterest","Instagram","Yelp","Microsoft Word","Microsoft Excel","Microsoft PowerPoint","HTML","CSS","PHP","JavaScript","CC","Content Writing","Blog Writing","Blog Commenting","Article Writing","Article Submission","Backlinking","Keyword Research","Link Building","Social Bookmarking","Directory Submission","Site Architecture","Web Hosting","Server Side Configuration","Content Management Systems"],
        "Paid Search"=> ["Microsoft AdCenter","Yahoo Sponsored Search", "Google Webmaster Tools","DoubleClick","ClickPath","Atlas","Omniture","Marin","Kenshoo","ComScore","HitBox","AdGooroo","WordTracker","Microsoft Word", "Microsoft Excel","Microsoft PowerPoint","Google Analytics","Content Management Systems", "SQL","HTML","CSS","Google AdWords","Google AdWords API","Google AdSense","Yahoo Search Marketing","Bing Search Marketing", "Google Search Marketing", "MSN Search Marketing", "Ad Copy", "Landing Page Optimization","A/B Testing"],
        "Marketing Strategy"=>["NetSuite","Salesforce","OnContact","Act","InfusionSoft","RelateIQ","Google Analytics", "Financial Modeling & Valuation","Statistics","Corporate Strategy","Corporate Branding","Digital Media Planning", "Traditional Media Planning"],
        "Social Media"=> ["Profile Creation","Profile Management","Content Creation","Content Sourcing","Page Creation","Page Management","Ad Creation","Ad Campaign Management","Post Scheduling","Message Management","Engagement with Fans","Targeted Recruitment of New Fans","Bitly","HootSuite","Buffer","SocialOomph","TweetDeck","Sprout Social","Video Production","Video Editing"]
    }
    puts "--"+discipline+"--"
    puts map[discipline]
    return map[discipline]
end
def tier_int(tier)
    {"Testing Ground"=>0,"Tier 1"=>1,"Tier 2"=>2, "Tier 3"=> 3,"Tier 4"=>4}[tier]
end
def disciplinefix(discipline)
    (discipline=="Search Engine Optimization") ? "SEO": (discipline=="Email") ? "Email Marketing":discipline
end
def discnum(num)
    {1=>"Marketing Strategy",2=>"Social Media",3=>"SEO",4=>"Paid Search",5=>"Email Marketing"}[num]
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
jobsmap=Hash[(1..150).map {|i| [i, []]}]
i=0
CSV.foreach("alexdb/jdata1.csv") do |row|
    unless i < 2
       p row
       jobsmap[row[3].to_i-3]<<row
    else
        i+=1
    end
end
Provider.delete_all
j=0
CSV.foreach("alexdb/pdata1.csv") do |row|
    j+=1
    stuff=row.split(",")[0]
    unless (stuff[0]=~/\A[-+]?[0-9]*\.?[0-9]+\Z/).nil?

        puts "~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~"
        employers=["Google","Facebook","Twitter","Amazon","Netflix","DataStacks","Twilio","Apple","Inciteful Emails", "Fly Social", "Gen110","A's Agency","CPC Love","ClickForrest","BDW Search","Integrated SEO","Mark Responsive","Corral Results"]
        positions=["Marketing Consultant","Outreach Specialist", "Web Marketing Designer", "Integration Coordinator", "Marketing Systems Specialist","Outreach Analyst","Director of Strategic Marketing"]
        references=["John Haywood", "Jane Alexander", "Thomas Woods", "Emma Banks","Joseph Sullivan","Monica Foster","Joan Addison","Graham Schneider", "Mia Davies","Gabriel Jacobs","Isaac Liu", "Jen Quigley", "Evan Alexander","Ethan Brown","Reed Smith", "Aiden Gleason","Dan Baker", "Katie Landon"]
        p row
        npj = (1..4).to_a.sample
        pjs=[]
        rfs=[]
        use=[]
        npjs=(1..4).to_a.sample
        nrfs=(1..npjs).to_a.sample
        for j in (1..npjs)
            blar=employers.shuffle.pop()
            use << blar
            pjs<< Pastjob.new({:pj_employer=>blar,:pj_position=>positions.pop()})
        end
        for l in (1..nrfs)
            rfs<<Reference.new({:ref_name=>references.pop(),:ref_company=>use.sample})
        end
        skills=[]
        stuff[20..-1].each do |skill|
            unless skill.nil?||!/[[:upper:]]/.match(skill[0])
                puts skill
                puts stuff[2]
                cap=lambda {|word| word[0].upcase+word[1..-1]}
                temp=[]
                skill.split.each do |word|
                    ["of","with","the"].include?(word) ? temp<<word : temp<<word[0].upcase+word[1..-1]
                end
                skill=temp.join(" ")
                puts skill
                puts Skill.where(:discipline=>disciplinefix(stuff[2]),:name=>skill).first.name
                skills<<Skill.where(:name=>skill,:discipline=>disciplinefix(stuff[2])).first
            end
        end
        disciplines=[]
        [0].each do |i|
            disciplines << Discipline.new({:name=>disciplinefix(stuff[2]),:years=>stuff[16].to_i,:description=>stuff[12],:skills=>skills})
        end
        puts skills
        myjobs=[]
        jobsmap[j].each do |myjob|
            tj=Job.new(:discipline=> discnum(myjob[4].to_i),:tier=>myjob[5].to_i-1)
            tj.job_meta=JobMeta.new("job_id"=>tj.id,:quality=>myjob[25].to_i,:timeliness=>myjob[26].to_i,:responsiveness=>myjob[27].to_i,:professionalism=>myjob[28].to_i,:likeability=>myjob[29].to_i,:knowledge=>myjob[30].to_i,:attention=>myjob[31].to_i)
            myjobs<<tj
        end
        p = Provider.new(:disciplines=> disciplines,
            :ptype=> stuff[4].downcase,
            :name=> !stuff[5].nil? ? stuff[6]+" "+stuff[5]:stuff[7].nil? ? "Outreach Design":stuff[7],
            :city=> stuff[8], :state=> stuff[9],
            :description=> stuff[10],
            :website=>stuff[12],
            :linkedin=>stuff[13],
            :education=>stuff[14],
            :type=>"Provider",
            :university=>stuff[15],
            :password=>"access",
            :password_confirmation=>"access",
            :email=>!stuff[5].nil? ? stuff[6].downcase+"."+stuff[5][0].downcase+$..to_s+"@gmail.com": stuff[7].nil? ? "outreachdesign@gmail.com":stuff[7].downcase.gsub(/\s+/,"")+"@gmail.com",
            :references=>rfs,
            :pastjobs=>pjs,
            :begin=>"2000-01-01 "+(stuff[18][-2..-1]=="pm" ? (stuff[18].split(":")[0].to_i+12).to_s+":"+stuff[18].split(":")[1][0..-3]:stuff[18][0..-3])+":00 UTC",
            :end=>"2000-01-01 "+(stuff[19][-2..-1]=="pm" ? (stuff[19].split(":")[0].to_i+12).to_s+":"+stuff[19].split(":")[1][0..-3]: stuff[19][0..-3])+":00 UTC",
            :jobs=>myjobs
                        )
        
        p.provider_meta=ProviderMeta.new(:user_id=>p.id,:tier=>tier_int(stuff[3]));
        p.save
    end
end


=begin
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
    result_references=[]
    result_pastjobs=[]
    num_disciplines=(1..5).to_a.sample
    num_pastjobs=(1..4).to_a.sample
    num_references=(2..4).to_a.sample
    disciplines=["Marketing Strategy","Email Marketing","Paid Search","SEO","Social Media"]
    references=["Zeus", "Poseidon", "Hades", "Hera","Athena","Aphrodite","Hephaestus"]
    positions=["Director of Awesome","Slam Dunk King", "Jabbawockee Slayer","Skiing Consultant"]
    for k in (1..num_disciplines)
        result_disciplines<< Discipline.new({:name=> disciplines.pop(),:years=>(1..15).to_a.sample,:description=>ulysses.split('.').sample})
    end
    use=[]
    for j in (1..num_pastjobs)
        blar=employers.pop()
        use << blar
        result_pastjobs<< Pastjob.new({:pj_employer=>blar,:pj_position=>positions.pop()})
    end
    for l in (1..num_references)
        result_references<<Reference.new({:ref_name=>references.pop(),:ref_company=>use.sample})
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
        :disciplines=>result_disciplines,
        :references=>result_references,
        :pastjobs=>result_pastjobs,
        :begin=> times[0],
        :end=> times[1]
end

=end

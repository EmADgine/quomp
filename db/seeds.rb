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
    ["Timeliness","Responsiveness","Knowledge","Quality of Work","Professionalism","Likeability","Attention to Detail"]
end
def get_tasks_by_discipline(discipline)
    map ={"Email Marketing"=> ["Email Design","Email Coding","Email Deliverability"],"SEO"=>["On Page Optimization","Off Page Optimization","On Page Audit"],"Paid Search"=> ["Campaign Research", "Campaign Set-Up","Campaign Optimization","Content and Display","Retargeting"],"Marketing Strategy"=>["Marketing Plan Development","Business Plan Development","Market Research","Consulting"],"Social Media"=>["Facebook Management","Twitter Management","Linkedin Management","Pinterest Management","Google+ Management","Instagram Management","Youtube Management","Vine Management"]}
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
def average_attribute(alist,name)
    total=0
    alist.each do |item|
        total+=eval("item.job_meta.#{name}")
    end
    total/alist.size.to_f
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
       jobsmap[row[3].to_i-3]<<row
    else
        i+=1
    end
end
Provider.delete_all
k=0
CSV.foreach("alexdb/pdata1.csv") do |row|
    p "k #{k}"
    stuff=row.split(",")[0]
    unless (stuff[0]=~/\A[-+]?[0-9]*\.?[0-9]+\Z/).nil?

        k+=1
        employers=["Google","Facebook","Twitter","Amazon","Netflix","DataStacks","Twilio","Apple","Inciteful Emails", "Fly Social", "Gen110","A's Agency","CPC Love","ClickForrest","BDW Search","Integrated SEO","Mark Responsive","Corral Results"]
        positions=["Marketing Consultant","Outreach Specialist", "Web Marketing Designer", "Integration Coordinator", "Marketing Systems Specialist","Outreach Analyst","Director of Strategic Marketing"]
        references=["John Haywood", "Jane Alexander", "Thomas Woods", "Emma Banks","Joseph Sullivan","Monica Foster","Joan Addison","Graham Schneider", "Mia Davies","Gabriel Jacobs","Isaac Liu", "Jen Quigley", "Evan Alexander","Ethan Brown","Reed Smith", "Aiden Gleason","Dan Baker", "Katie Landon"]
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
                cap=lambda {|word| word[0].upcase+word[1..-1]}
                temp=[]
                skill.split.each do |word|
                    ["of","with","the"].include?(word) ? temp<<word : temp<<word[0].upcase+word[1..-1]
                end
                skill=temp.join(" ")
                skills<<Skill.where(:name=>skill,:discipline=>disciplinefix(stuff[2])).first
            end
        end

        name=!stuff[5].nil? ? stuff[6]+" "+stuff[5]:stuff[7].nil? ? "Outreach Design":stuff[7]
        filename= (stuff[4].downcase.strip=="agency") ? name.downcase.split.join("_").camelize : name.downcase.split.join("_")
        filename=filename.gsub("'","")
        disciplines=[]
        [0].each do |m|
            disciplines << Discipline.new({:name=>disciplinefix(stuff[2]),:years=>stuff[16].to_i,:description=>stuff[12],:skills=>skills,:portfolio=>File.new("#{Rails.root}/seedfiles/Portfolios/"+disciplinefix(stuff[2]).split.join("_").strip+"/"+filename+"_portfolio.pdf")})
        end
        myjobs=[]
        p k
        p jobsmap[k]
        jobsmap[k].each do |myjob|
            p "______________"
            p disciplinefix(stuff[2])
            p discnum(myjob[4].to_i)
            p "~~~~~~~~~~~~~~~"
            p tier_int(stuff[3])
            p myjob[5].to_i-1
            tj=Job.new(:discipline=> discnum(myjob[4].to_i),:tier=>myjob[5].to_i-1,:deadline=>myjob[12].split[0])
            p "tj tier #{tj.tier}"
            tj.job_meta=JobMeta.new("job_id"=>tj.id,:quality=>myjob[25].to_i,:timeliness=>myjob[26].to_i,:responsiveness=>myjob[27].to_i,:professionalism=>myjob[28].to_i,:likeability=>myjob[29].to_i,:knowledge=>myjob[30].to_i,:attention=>myjob[31].to_i)
            myjobs<<tj
        end
        p = Provider.new(:disciplines=> disciplines,
            :ptype=> stuff[4].downcase.strip,
            :name=> name,
            :city=> stuff[8], :state=> stuff[9],
            :description=> stuff[10],
            :avatar=>File.new("#{Rails.root}/seedfiles/Headshots/"+filename.downcase+"_headshot.jpg"),
            :resume=> (stuff[4].downcase.strip=="agency") ? nil : File.new("#{Rails.root}/seedfiles/Resumes/"+filename+"_resume.pdf"),
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
            :jobs=>myjobs)
        p.provider_meta=ProviderMeta.new(:user_id=>p.id,:tier=>tier_int(stuff[3]),:quality=>average_attribute(myjobs,:quality),:responsiveness=>average_attribute(myjobs,:responsiveness),:likeability=>average_attribute(myjobs,:likeability),:knowledge=>average_attribute(myjobs,:knowledge),:professionalism=>average_attribute(myjobs,:knowledge),:timeliness=>average_attribute(myjobs,:timeliness),:attention=>average_attribute(myjobs,:attention))
        p.save
    end
end

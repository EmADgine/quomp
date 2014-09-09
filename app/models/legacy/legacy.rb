class Legacy
    Dir["#{Rails.root}/app/models/legacy/primary/*.rb"].each {|file| require file }
end

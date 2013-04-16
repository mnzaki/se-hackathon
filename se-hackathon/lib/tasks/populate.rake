namespace :db do
  desc "Insert random data into the database"
  task :populate => :environment do
    10.times do
      Hacker.create(email: Faker::Internet.email,
                    name: Faker::Name.name,
                    password: 123123123)
    end

    ["Validation", "Controller", "View", "AJAX", "UX", "API"].each do |n|
      Category.create(name: n)
    end

    10.times do |n|
      u = UserStory.create(description: Faker::Lorem.paragraph,
                           number: n)
      Random.rand(6).times do |n|
        #Task.create(userstory: u)
      end
    end
  end
end

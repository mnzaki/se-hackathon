namespace :db do
  desc "Insert random data into the database"
  task :populate => :environment do
    h = Hackathon.first
    unless h
      h = Hackathon.create
    10.times do
      Hacker.create(email: Faker::Internet.email,
                    name: Faker::Name.name,
                    password: 123123123)
      end
    end

    ["Validation", "Controller", "View", "AJAX", "UX", "API"].each do |n|
      Category.create(name: n)
    end

    10.times do |n|
      u = UserStory.create(description: Faker::Lorem.paragraph,
                           number: n,
                           hackathon_id: h.id)
      Random.rand(6).times do |nt|
        Task.create(user_story_id: u.id,
                    points: Random.rand(10),
                    time_limit: Random.rand(10)*10+30,
                    minimum_global_level: 1,
                    category_id: Category.find(Random.rand(Category.count)+1).id,
                    description: Faker::Lorem.paragraph,
                    name: Faker::Lorem.sentence,
                    done: false,
                    number: nt)
      end
    end
  end
end

require 'faker'

fei_info = { first_name: "First", last_name: "Li", email: "lifei@gmail.com", password: "xxx", username: "lifei"}
fei = User.new(fei_info)
fei.phone_number = "+14084555868"
fei.save!

4.times do
  person = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::PhoneNumber.cell_phone, password: "xxx" }
  person[:email] = Faker::Internet.safe_email("#{person[:first_name]}.#{person[:last_name]}")
  person[:username] = "#{person[:first_name]}#{person[:last_name]}".downcase
  contact = User.new(person)
  contact.save!
end

20.times do
  list_details = { name: ["Big Data", "Analytics", "Strategy", "Virtual Reality", "Gaming", "Ed Tech", "BioTech", "Cybersecurity", "Digital Marketing", "Front-end Developers", "Full-stack Leads", "Alumni from University", "Augmented Reality Companies", "Fintech", "Internet Companies", "Digital Media", "General Connections", "3D Printing Companies", "Social Media Companies"].sample,
                   tier: (1+rand(3)),
                   notes: Faker::Lorem.paragraph,
                   user_id: (1+rand(5))}
  list = List.new(list_details)
  list.save!
end

80.times do
        person = { first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   title: Faker::Name.title,
                   company: Faker::Company.name,
                   phone: Faker::PhoneNumber.cell_phone,
                   mobile: Faker::PhoneNumber.cell_phone,
                   website: Faker::Internet.url,
                   industry: Faker::Job.field,
                   linkedin: "www.linkedin.com/#{Faker::Internet.user_name}",
                   notes: Faker::Lorem.paragraph,
                   list_id: (1+rand(20)) }
  person[:email] = Faker::Internet.safe_email("#{person[:first_name]}.#{person[:last_name]}")
  connection = Connection.new(person)
  connection.save!
end

320.times do
            date = {date: Faker::Date.between(1.year.ago, Date.today),
                    connection_id: 1+rand(80),
                    method_of_contact: ["phone", "coffee", "lunch", "drinks", "food", "in-person"].sample,
                    location: Faker::Address.street_name,
                    professional_discussion: Faker::Lorem.paragraph,
                    casual_discussion: Faker::Lorem.paragraph,
                    notes: Faker::Lorem.paragraph,
                    follow_up_topics: Faker::Lorem.paragraph }
  interaction = Interaction.new(date)
  interaction.save!
end

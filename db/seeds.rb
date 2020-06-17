require 'faker'

puts "Destroy books"
Book.destroy_all if Rails.env.development?

puts "Creating books.."
3.times do
  puts "Creating user.."
  user = User.create!(username: Faker::Name.first_name, email: Faker::Internet.email, password: "123456")
  4.times do |x|
    book = Book.new
    book.title = Faker::Book.title
    book.description = Faker::Hipster.paragraph
    book.year = Faker::Date.between(from: 1990, to: 2020)
    book.author = Faker::Book.author
    book.price = rand(100)
    book.condition = ['new', 'used', 'new-ish', 'old'].sample
    book.owner_id = user.id

    if book.save!
      puts "book #{x} done"
    else
      puts "book #{x} Incomplete!"
    end
  end

end

puts 'Completed!'

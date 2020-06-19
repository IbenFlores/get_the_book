require 'faker'

puts "Destroy books"
Book.destroy_all if Rails.env.development?
book_pics = ['https://images.unsplash.com/photo-1459369510627-9efbee1e6051?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
'https://images.unsplash.com/photo-1535398089889-dd807df1dfaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
'https://images.unsplash.com/photo-1539877254216-818ed7c76096?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60']

puts "Creating books.."
3.times do
  puts "Creating user.."
  user = User.create!(username: Faker::Name.first_name, email: Faker::Internet.email, password: "123456")
  4.times do |x|
    book = Book.new
    book.photo_url = book_pics.sample
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

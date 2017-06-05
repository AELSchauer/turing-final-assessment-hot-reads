20.times do |i|
  url = Url.create(address: "https://en.wikipedia.org/wiki/#{i}")
  (i+1).times do |id|
    url.reads.create(user_id: id+1)
    url.reads.create(user_id: id+21, created_at: Time.new - (60 * 60 * 24 * 2))
  end
end

puts "Urls: #{Url.count}"
puts "Reads: #{Read.count}"

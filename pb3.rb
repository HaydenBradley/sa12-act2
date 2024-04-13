require 'httparty'
area = 'Europe'
location = 'London'
url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"

response = HTTParty.get(url)

if response.success?
  data = JSON.parse(response.body)

  current_datetime = data['datetime']

  puts "The current time in #{area}/#{location} is #{current_datetime}"

  puts output
end
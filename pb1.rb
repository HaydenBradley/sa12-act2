require 'httparty'
require 'json'

username = 'freeCodeCamp'
url = "https://api.github.com/users/#{username}/repos"
response = HTTParty.get(url)

if response.success?
  repositories = JSON.parse(response.body)

  max_stars = 0
  max_starred_repo = nil

  repositories.each do |repo|
    name = repo['name']
    description = repo['description']
    stars = repo['stargazers_count']
    url = repo['html_url']

    if stars > max_stars
      max_stars = stars
      max_starred_repo = { name: name, description: description, stars: stars, url: url }
    end
  end
  
  if max_starred_repo
    puts "Most Starred: #{max_starred_repo[:name]}"
    puts "Description: #{max_starred_repo[:description]}"
    puts "Stars: #{max_starred_repo[:stars]}"
    puts "URL: #{max_starred_repo[:url]}"
  end
end

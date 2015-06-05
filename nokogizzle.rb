require 'rubygems'
require 'nokogiri'
require 'open-uri'
filename = ARGV[0]
page = Nokogiri::HTML(open(filename))

page.css('link').each do |link|
  link[:href] = link[:href].sub!("/css", "css")
end

page.css('h1','h2','h3','p','b','span').each do |line|
  line.content = line.content.sub("Array", "BUTT")
  line.content = line.content.sub("array", "BUTT")
end

# page.css('h2').each do |line|
#   line.content = line.content.sub("Array", "BUTT")
#   line.content = line.content.sub("array", "BUTT")
# end

# page.css('h3').each do |line|
#   line.content = line.content.sub("Array", "BUTT")
#   line.content = line.content.sub("array", "BUTT")
# end

# page.css('p').each do |line|
#   line.content = line.content.sub!("Array", "BUTT")
#   line.content = line.content.sub!("array", "BUTT")
# end



replacement = File.open("replaced.html","w+") do |file|
  file.puts page.to_html
end

puts replacement.inspect
exec("open replaced.html")

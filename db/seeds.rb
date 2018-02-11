require 'csv'

csv_text = File.read(Rails.root.join('db','db_csv','import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |article|
  Article.where(title: article['title'], description: article['description'], tags: article['tags'], author: article['author']).first_or_create
end


puts "There is #{Article.count} articles in the articles table"

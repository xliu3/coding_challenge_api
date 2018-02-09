require 'csv'

csv_text = File.read(Rails.root.join('db','db_csv','import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |r|
  article = Article.new

  article.title = r['title']
  article.description = r['description']
  article.tags = r['tags']
  article.author = r['author']
  article.created_at = r['created_at']
  article.updated_at = r['updated_at']
  article.save

  puts "New Article (#{title}) saved"
end


puts "There is #{Article.count} articles in the articles table"

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	article[:type] = 'Article'
	article[:text_filter_id] = 1
	article[:allow_comments] = "t"
	article[:allow_pings] = "f"
	article[:state] = "published"
	article[:published] = "t"

	Article.create!(article)
  end
end
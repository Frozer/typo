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

Given /article (\d) has comment with text "([^"]*)"/ do |articleid, commentbody|
	article = Article.find(articleid)
	comment = {:body => commentbody}
	comment[:author] = "test"
	comment[:email] = "test@test.test"
	comment[:status_confirmed] = "t"
	comment[:published] = "t"

	c = article.add_comment(comment)
	c.save!
end
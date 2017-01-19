
1. Create the appropriate models
	
	rails g model User first_name:string last_name:string email_address:string
	rails g model Blog name:string description:text
	rails g model Post blog:references user:references title:string content:text
	rails g model Message post:references user:references author:string messages:text
	rails g model Owner user:references blog:references
	rake db:migrate

2. Create 5 users

	User.create(first:_name:"Katrina", last_name:"Sanford", email_address:"katrina.sanford@hotmail.com")
	...

3.  Create 5 blogs

	Blog.create(name:"First Bog", description:"Just some yammering on for the first blog ever on this site!")
	Owner.create(user:User.first, blog:Blog.first)
	...

4. Have the third user own all of the blogs

	Blog.all.each{|b| Owner.create(user:User.find(3), blog:b)}

5.  Have the first user create 3 posts for the blog with an id of 2

	Post.create(blog:Blog.find(2), user:User.first, title:"The very first post", content:"I loved this blog, your writing style is very humorous")
	...

6. Have the second user create 5 posts for the last blog

	Post.create(blog:Blog.last, user:User.find(2), title:"The Beginning", content:"This is just the beginning of our story")
	...


7. Have the third user create different posts for different blogs
	
	Post.create(blog:Blog.find(2), user:User.find(3), title:"This is a good one!", content:" Beats all you've ever saw been in trouble with the law since the day they was born.")
	...

8.  Have the third user create 2 messages for the first post created and 3 messages for the second post created

	Message.create(post:Post.first, user:User.find(3), author:"Jimmy Dean", message:"The Brady Bunch the Brady Bunch that's the way we all became the Brady Bunch?")
	...
	Message.create(post:Post.find(2), user:User.find(3), author:"Dolly Parton", message:"Movin' on up to the east side. We finally got a piece of the pie.")
	...

9. Have the fourth user create 3 messages for the last post you created

	Message.create(post:Post.last, user:User.find(4), author:"Dancing Dan", message:" It's time to play the music. It's time to light the lights. It's time to meet the Muppets on the Muppet Show tonight.")
	...

10.  Change the owner of the second post to the last user
	
	Post.find(2).update(user:User.last)

11.  Change the second post's description to be something else

	Post.find(2).update(content:"Changed just because I could!")

12.  Retrieve all the blogs owned by the third user

	User.find(3).blogs

13.  Retrieve all posts that were created by the third user

	User.find(3).posts

14.  Retrieve all messages left by the third user

	User.find(3).messages

15.  Retrieve all posts associated with the first blog as well as all who left those posts
	
	So, I was not sure what the correct way of going about this was.  Here is my solution, because I do not like to have multiple queries.
		Post.find_by_sql("SELECT * FROM posts INNER JOIN users ON posts.user_id = users.id WHERE posts.blog_id = 1)

	Another way that I just discovered that is awesome! (Thanks to Martin's searching)
		Blog.first.posts.select('posts.*, users.*').joins(:user)

16.  Retrieve all messages associated with the 	first blog as well as all who left those messages

	Blog.first.messages.select('messages.*, users.*').joins(:user)

17. Grab all user information of those that own the first blog

	Blog.first.users

18.  Change it so that the first blog is no longer owned by the first user
	
	Owner.find_by(blog:Blog.first, user:User.first).destroy
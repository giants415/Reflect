#Reflect
####Andrew Vinocur


##Landing Page
![Reflect] (http://i.imgur.com/iC2L46H.png)

###Visit [Reflect](https://blooming-spire-67123.herokuapp.com/)



##Concept
Reflect was designed to provide users with a place to write down their feelings/thoughts/etc about the events of a day and then reflect upon them. To aid a user's reflection process, users are currently able to "cloudify" their entry to see a visual representation of the most commonly used words in their posts. By visually displaying the words they used, users are able to reflect upon that moment or at any point in the future to see whether their initial feelings are in line with how they feel now.

In the future, users will be able to enter a rating before and after finishing their entry. This will help a user to track the effectiveness of their journaling by seeing their pre/post ratings for each entry. Ultimately, these ratings will be aggregated and displayed on the user's dashboard.


###Future Development Ideas
* Allow users to rate how they feel before they write their post and then after finishing. This data will be displayed on each post and aggregated on the user dashboard.

* Filter to prevent certain words from being used in the word cloud or to weight them less heavily

* Send a welcome email

* Modals for Login

* Better error messages


##Technologies
1. Rails 5
2. Ruby, jQuery, Javascript
3. Gems: Bcrypt, WordsCounted, jqCloud 1, Kaminari
4. Materialize, SASS
5. Heroku


##Installation
If you would like to work with this project

1. Fork and clone the repo down to your computer
2. Bundle install to enable the necessary gems
3. Start developing!

##User Stories
###New User
* Sign Up with email, username, and a password
* Forwarded to your user profile page to start reflecting

###Returning User
* Log In and be forwarded to your profile page
* Users can then...
	* Edit their profile's username and email
	* Make a post
	* Cloudify (make a word cloud) their post
	* FUTURE: Review their pre/post entry ratings

##Wireframe

![Reflect Wireframe] (http://i.imgur.com/YK2KL8f.png)

##ERD

![Reflect ERD] (http://i.imgur.com/5ILsNvg.png)

##Code Samples

###WordCloud
---
####Posts Controller
```ruby
def create
	@post = Post.create(post_params)
	counter = WordsCounted.count(@post.content, {exclude: ->(t) {t.length < 3}})
	@post.words_counted = counter.token_count
	counter.token_frequency
	@post.words_freq = wordCount_formatter(counter.token_frequency).to_json
	@post.save
	redirect_to user_path(@post.user_id)
end
```

####Posts Helper
```ruby
def wordCount_formatter(counter_token_frequency)
	output = []
	word_freq_array = counter_token_frequency
	word_freq_array.each_with_index do |word_block,index|
		word_hash = {}
		word_hash["text"] = word_block[0].to_s
		word_hash["weight"] = word_block[1].to_i
		output << word_hash
	end
	output
end
```

####Word Cloud
```javascript
<div id= "target" class = "align-center" style="width: 750px; height: 750px;"></div>

<script type = "text/javascript">
	var word_array = <%= raw @posts.first.words_freq.to_json %> ;
	word_array = JSON.parse(word_array);
	$(function() {
	  $("#target").jQCloud(word_array);
	});
</script>
```

###Buttons
---

####Home
```html.erb
<%= link_to user_path(current_user.id), method: :get, class: "fa fa-home fa-2x" do %>
	<i aria-hidden="true"></i>
<% end %>
```

####Write a Reflection & Edit

```html.erb
<%= button_to edit_user_path, method: "get", class: "fa fa-pencil-square-o" do %>
	<i aria-hidden="true">Edit Profile</i>
<% end %>

<%= button_to new_user_post_path(:user_id => @user.id), method: :get, class: "fa fa-pencil" do %>
	<i aria-hidden="true">Write a Reflection</i>
<% end %>
```

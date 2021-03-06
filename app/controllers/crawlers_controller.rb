require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'active_record'
require 'twitter'

class CrawlersController < ApplicationController

def new
	@twitter = Twitterlink.new
end

def create
	# hard code the url to save time.
	page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_American_film_actresses"))   
	# nokogiri CSS picker. 
	namelist =  page.css('div#bodyContent').css('div.div-col').css('li a')
	# how many people to fetch?
	puts namelist.length
	
	#I have listed all of my 9 apps. I should create a new class to do all the things in the following. But no time.
	client1 = Twitter::REST::Client.new do |config|
		config.consumer_key = "0cDIgOvL264SMGcpWSA3g"
 		config.consumer_secret = "2VP5ZbpsFVM8MYkZBLzifjvtaCgdzKLejRaPpVx1A"
  		config.access_token = "593841342-dpqQMGys7hmF4jiTtzQeZNJHGsoPLXwdOc7fiHgo"
  		config.access_token_secret = "q2WE9WYkmJniuvQHyjNRh5wLNv8svOmpPnMlrsuivE"
	end
	client2 = Twitter::REST::Client.new do |config|
		config.consumer_key = "FJ5e8ILB2bj2bHXqHrqIw"
 		config.consumer_secret = "9qyvGO7mF45L83mdgtX0F0QkXL3iduRqJmwsi9LfE"
  		config.access_token = "593841342-95AcUpKiPmxuU5wdpb8ss7TALOqGgCgnoWbSl3iS"
  		config.access_token_secret = "JQitklp1gLWJ68gZgzX71ppGryKru2DbLwIQfRVKLUq2W"
	end
	client3 = Twitter::REST::Client.new do |config|
		config.consumer_key = "RYFTbd2gWNaphrLsrjl5A"
 		config.consumer_secret = "RFxsM2hP91bacUjh6SRDHJ2h7BPj12giz2SV8hjgo"
  		config.access_token = "593841342-acxYX9J0cbz7pIdtgd7KQBVisj1iTGVgmgFZG1NF"
  		config.access_token_secret = "xf6yASoto2UvrIyBlmZUVCMTGEhUIQ9FXNF97TruUrsnx"
	end
	client4 = Twitter::REST::Client.new do |config|
		config.consumer_key = "OC4njE0YXwDGrZMomjvcw"
 		config.consumer_secret = "eehYeiBTxcv8NOyT5XtG4wlEXVFziYEt1MClZD64b0"
  		config.access_token = "593841342-7qB6VEsSFbh83o1l7NEngustftJGEuJ4vykH5dDK"
  		config.access_token_secret = "BwSBjGuEpFymWU6o8GvfrgM10Y6s5D1UnoVHCmiYuBy0D"
	end
	client5 = Twitter::REST::Client.new do |config|
		config.consumer_key = "3BOEj19ODi3TdHPiXUSCZw"
 		config.consumer_secret = "ETGFLY7ihyeZjb1zmB7QQ8li6NjJhNmTfKUiepzG830"
  		config.access_token = "593841342-TxVOCOjT6TvRGweHdM43bsiBBdQ5L3xYcG5Npohy"
  		config.access_token_secret = "BRmwjgeFbb61pQhY4okSxRHVFzSE9hpCTErkyBxsgF8FM"
	end
	client6 = Twitter::REST::Client.new do |config|
		config.consumer_key = "32ChX8yqI0Fk2XHhSQ"
 		config.consumer_secret = "ugbs2r0UJshe2HzcXa3zYNnezYReDKWm0kVU4tIr0"
  		config.access_token = "593841342-Qsw1kuobNQmdXExj7S9qo6UDen4RMGUrVlqC2BMO"
  		config.access_token_secret = "p0h5r761l3LGQ90WcGdKUOZ2YUDmHsvvbsrXcQU5ts2OP"
	end
	client7 = Twitter::REST::Client.new do |config|
		config.consumer_key = "y9ljN0UkEfywL0WfN9Xctw"
 		config.consumer_secret = "QRU8T6hhdsv8NblPpaFo83ELbKHjnTpgUN60aMZ3uFo"
  		config.access_token = "2293337509-gnL5NiZL6slqLaa6EBzNToFpep9lUq8xGG6CeEI"
  		config.access_token_secret = "aXHOKa12xE3CcD5ljWNnJZD7FoASKh245fq1zhynUF4QA"
	end
	client8 = Twitter::REST::Client.new do |config|
		config.consumer_key = "6z2wg9RbhggH19MxhMlTA"
 		config.consumer_secret = "eRWB5w0AF9JlGoGTz0u1JMZX4zRYCTVOWw4zUWRQ"
  		config.access_token = "116133790-bIc82pc9W4D8LG7uvnDAMSrC7bJLdD1wXqzXHx0V"
  		config.access_token_secret = "t65AoOR4VLlZULnCawzDbhIqDhg5fEhdm7fw4oLe4Aqbt"
	end
	client9 = Twitter::REST::Client.new do |config|
		config.consumer_key = "2HAMXyHqALoBW5A0Mj4ZxA"
 		config.consumer_secret = "d821QDZdBkGknmvDdG0PQ0ofzmDXQ6W4taO9oNQE"
  		config.access_token = "116133790-ROykheqnrjTPR6ZfAlOaXoKub90YGDATYjwB8y7l"
  		config.access_token_secret = "BrNYX0jP2Fn8JhKIdec0iN7CFaG4rLpuztLxCzZL2yiT7"
	end

	#Two ec2 instance, the difference is the client.
	#client = [client1, client2,client3,client4,client5,client6,client7, client8, client9]
	client = [client2,client4,client6,client8]
	puts client
	# loop through the client first
	for k in 0..3
	# every client deal with 177 people
	for i in 0..176
	begin
	    maxpeople = 885+177*k+i
	    ## use mod operation here just to avoid the array out of index. Actually, I repeated the first few person.	
	    nametosearch = namelist.at(maxpeople%1586).text
	    clienttouse = client.at(k)
	    @twitter = clienttouse.user_search(nametosearch)
	    if @twitter
		#if no result at all, return 'people not found'
		if @twitter.length == 0
			@cele = Twitterlinkmore.create(name:nametosearch, link:"people not found")
			@cele.save
		#if there are results, proceed, and find a verified people with fans more than 1000. We only care the first 5 results
		#Of course, there are false positive, but we can always bulid rules to make the result more accurate.
		else
			found = false		
			for j in 0..4
			      if twitter_user = @twitter[j]
				#if found, add to database and set the trigger 'found' to be true.
				if "#{twitter_user[:verified]}" == "true" and twitter_user[:followers_count] >=1000
					@cele = Twitterlinkmore.create(name:nametosearch, link: "#{twitter_user[:url]}",
					verified:"#{twitter_user[:verified]}", fans:"#{twitter_user[:followers_count]}",certaintylevel:j)
					@cele.save
					found = true
					break
				end
			      end	
			end
			# if none of the five results meet our threshold, we just take the first one. 
			# we also set the certaintylevel to be 5, which means nearly incrediable. (0 means highest certainty)
			if found==false
				if twitter_user = @twitter.first
				@cele = Twitterlinkmore.create(name:nametosearch, link: "#{twitter_user[:url]}",
					verified:"#{twitter_user[:verified]}", fans:"#{twitter_user[:followers_count]}",certaintylevel:5)
				@cele.save
				end			
			end
	    	end
	  end
	  rescue Exception => e
	    puts "Something else went wrong:"
	    puts e.message
	  end
	end
	end
	render text: params[:crawler].inspect
end

def show
	@twitter = Twitterlinkmore.find(params[:id])
end

end

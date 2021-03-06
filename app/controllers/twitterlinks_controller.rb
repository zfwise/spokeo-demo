class TwitterlinksController < ApplicationController

#this is the Controller I followed the RoR guide and coded. It's nothing but following the guide.
def new
	@twitter = Twitterlink.new
end

def create
	@twitter = Twitterlink.new(twitter_params)
	if @twitter.save
		redirect_to @twitter
	else
		render 'new'
	end
end

def show
	@twitter = Twitterlink.find(params[:id])
end

def index
	@twitter = Twitterlink.all
end

def edit
	@twitter = Twitterlink.find(params[:id])
end

def update
	@twitter = Twitterlink.find(params[:id])

	if @twitter.update(twitter_params)
		redirect_to @twitter
	else
		render 'edit'
	end
end

def destroy
	@twitter = Twitterlink.find(params[:id])
	@twitter.destroy

	redirect_to twitterlinks_path
end

private
	def twitter_params
		params.require(:twitterlink).permit(:name, :link)
	end


end

require 'active_record'

class ForajaxsController < ApplicationController

#this is my Ajax controller
#since RoR can't handle multi-request, I changed my mind as use this as the final result page
def index
	@twitter = Twitterlinkmore.all
end


end

class SiteController < ApplicationController
  def index
  	@articles = Article.limit(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
	end

  def becomeanartist
    @arttype = Artist.all.uniq_by(&:arttype)
 end

 

  end
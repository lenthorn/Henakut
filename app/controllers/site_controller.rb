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

def commissionartwork
    @artname = Artist.all.uniq_by(&:artistname)

    @arttype = Artist.all.uniq_by(&:arttype)
 end

 # def becomeanartist
  # 	@arttype = Artist.all_arttype

    # respond_to do |format|
     #  format.html # index.html.erb
     #  format.json { render json: @arttype }
    # end
	# end

  end
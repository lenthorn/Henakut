class PiecesController < ApplicationController
  # GET /pieces
  # GET /pieces.json
  before_filter :ensure_admin, :except => [:index, :show, :category, :search]
  helper_method :sort_column, :sort_direction 
  
def ensure_admin
    unless current_user && current_user.admin?
      render :text => "You dont have the access to do this!", :status => :unauthorized
    end
end

def show
    @piece = Piece.find(params[:id])
  @artist = Artist.find(@piece.artist_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @piece }
    end
  end

  def index
    @pieces = Piece.order(sort_column + ' ' + sort_direction).paginate(:per_page=>9, :page => params[:page])
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pieces }
    end
  end

   private  
    def sort_column  
    Piece.column_names.include?(params[:sort]) ? params[:sort] : "name"  
    end  
       
    def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end 


  # GET /pieces/1
  # GET /pieces/1.json



def artstyle
    @pieces = Piece.find_all_by_artstyle(params[:id])
    @artstyle = params[:id]
   respond_to do |format|
   format.html # index.html.erb
   format.json { render json: @pieces }
  end
 end

def artmedium
    @pieces = Piece.find_all_by_artmedium(params[:id])
    @artmedium = params[:id]
   respond_to do |format|
   format.html # index.html.erb
   format.json { render json: @pieces }
  end
 end

def artcolour
    @pieces = Piece.find_all_by_artcolour(params[:id])
    @artcolour = params[:id]
   respond_to do |format|
   format.html # index.html.erb
   format.json { render json: @pieces }
  end
 end

 def search
    
    @pieces = []
    
    q = "%#{params[:q]}%"

    @pieces += Piece.find :all, :conditions => [
      "arttype LIKE ? and (name LIKE ? or artstyle LIKE ?)",
      params[:arttype],
      q,
      q
    ]

   artists = Artist.find :all, :conditions => [
      "artistname LIKE ?",
      q
    ]


    artists.each{ |artist| 
      artist.pieces.each{ |piece|
        @pieces += [piece] if piece.arttype == params[:arttype]
      } 
    }
    
     @search_term = params[:q]
    respond_to do |format|
      format.html # index.html.erb
    format.json { render json: @pieces }
   end
  end


  # GET /pieces/new
  # GET /pieces/new.json
  def new
    @piece = Piece.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @piece }
    end
  end

  # GET /pieces/1/edit
  def edit
    @piece = Piece.find(params[:id])
  end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(params[:piece])

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render json: @piece, status: :created, location: @piece }
      else
        format.html { render action: "new" }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pieces/1
  # PUT /pieces/1.json
  def update
    @piece = Piece.find(params[:id])

    respond_to do |format|
      if @piece.update_attributes(params[:piece])
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy

    respond_to do |format|
      format.html { redirect_to pieces_url }
      format.json { head :no_content }
    end
  end
end

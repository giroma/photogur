class PicturesController < ApplicationController
  before_action :ensure_logged_in, except: [:index, :show]

  def index
    @pictures = Picture.all
    @most_recent_five = Picture.most_recent_five.order(:id)
    @month_ago = Picture.created_before(1.month.ago)
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    if @picture.save
      flash.notice = 'Product successfully updated!'
     # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
     # otherwise render new.html.erb
      render :new
    end
  end
  def edit
      @picture = Picture.find(params[:id])
  end
  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      flash.notice = 'Product successfully updated!'
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end
end

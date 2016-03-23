class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :find_author, only: [ :show, :edit, :update, :destroy ]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = "Author was saved successfully"
      redirect_to authors_path
    else
      flash.now[:error] = "Author was not saved successfully"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author was saved successfully"
      redirect_to authors_path
    else
      flash.now[:error] = "Author was not saved successfully"
      render :edit
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def find_author
    @author = Author.find(params[:id])
  end
end

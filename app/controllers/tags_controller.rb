class TagsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :find_tag, only: [ :show, :edit, :update, :destroy ]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Tag was saved successfully"
      redirect_to tags_path
    else
      flash.now[:error] = "Tag was not saved successfully"
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      flash[:notice] = "Tag was saved successfully"
      redirect_to tags_path
    else
      flash.now[:error] = "Tag was not saved successfully"
      render :edit
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end

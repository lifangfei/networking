class ListsController < ApplicationController

  def index
    user = User.find(session[:user_id])
    @lists = user.lists.sort_by{|list| list.tier}
    render :index
  end

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(params[:list])
    @list.user_id = session[:user_id]
    if @list.save
      redirect_to lists_path
    else
      @errors = @list.errors.full_messages
      render :new, status 422
    end
  end

  def show
    user = User.find(session[:user_id])
    @list = List.find(params[:id])
    redirect '/lists' unless user.lists.include? @list
    if request.xhr?
      render :index, layout: false, locals: {list: @list}
    else
      render :show
    end
  end

  def edit
    user = User.find(session[:user_id])
    @list = List.find(params[:id])
    redirect_to lists_path unless user.lists.include? @list
    render :edit
  end

  def update
    @list = List.find(params[:id])
    @list.update(params[:list])
    if @list.valid?
      redirect_to list_path(@list)
    else
      status 422
      @errors = @list.errors.full_messages
      render :edit
    end
  end

  def delete
    user = User.find(session[:user_id])
    @list = List.find(params[:id])
    redirect_to lists_path unless user.lists.include? @list
    @list.destroy!
    redirect_to lists_path
  end
end

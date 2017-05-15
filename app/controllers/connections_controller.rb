class ConnectionsController < ApplicationController

  def index
    user = User.find(session[:user_id])
    @connections = user.connections
  end

  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(params[:connection])
    if @connection.save
      redirect_to connections_path, status: 302
    else
      @errors = @connection.errors.full_messages
      render :new, status: 422
    end
  end

  def show
    user = User.find(session[:user_id])
    @connections = user.connections
    @connection = Connection.find(params[:id])
    redirect_to new_connections_path unless @connections.include? @connection
    if request.xhr?
      render :index, layout: false, locals: {connection: @connection}
    else
      render :show
    end
  end

  def edit
    # redirect '/login' unless session[:connection_id] == params[:id].to_i
    @connection = Connection.find(params[:id])
    render :edit
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(params[:connection])
    if @connection.valid?
      redirect_to connection_path(@connection)
    else
      @errors = @connection.errors.full_messages
      render :edit, status 422
    end
  end

  def delete
    Connection.find(params[:id]).destroy!
    redirect_to connections_path
  end

end

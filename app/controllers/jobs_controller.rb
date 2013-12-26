class JobsController < ApplicationController
 
  def index
  	@jobs = Job.find_all( { order_by: "updated_at DESC" } )
  end

  def show
  	@job = Job.find( params[:id] )
  end

  def edit
  	@job = Job.find( params[:id] )
  end

  def update
  	@job = Job.update( params )
  end

  def new
  	@job = Job.new
  end

  def create
  	#need to check for errors
  	@job = Job.create( params )
  end

end

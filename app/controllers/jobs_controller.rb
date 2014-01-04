class JobsController < ApplicationController
 
  def index
    list
    render :list
  end

  def list
    @jobs = Job.order( 'updated_at DESC' ).limit( 10 )
  end

  def show
  	@job = Job.find( params[:id] )
  end

  def edit
  	@job = Job.find( params[:id] )
  end

  def update
    job = Job.find( params[:id] )
    if current_user.id == job.user_id 
      if job.update_attributes( job_params )
        flash[:notice] = 'Job saved.'
        redirect_to( :action => 'index', :controller => 'jobs' )
      else
        flash[:notice] = '<%= job.errors %>'
      end
    else 
      flash[:notice] = "That's not your job to edit!"
    end
  end

  def new
  	@job = Job.new
  end

  def create
    @job = Job.new( job_params )
    @job.user_id = current_user.id
  	#need to check for errors
    if @job.save
      flash[:notice] = 'Job saved.'
      redirect_to( :action => 'index', :controller => 'jobs' )
    else
      flash[:notice] = '<%= @job.errors %>'
      render( :action => 'new' )
    end
  end

  def job_params
    params.require( :job ).permit(:title,:details,:job_time,:currency,:pay_rate,:pay_type,:flyering)
  end

end

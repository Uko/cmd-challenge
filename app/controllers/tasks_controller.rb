class TasksController < ApplicationController
  before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.find(:all, :order => 'updated_at DESC')
    @shared_tasks = current_user.shared_tasks.find(:all, :order => 'updated_at DESC', :include => :user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = current_user.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to :action => :index, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to :action => :index, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.json { head :no_content }
    end
    
  end
  
  #POST /tasks/1/share.json
  def share
    user = User.find_by_email(params[:user][:email])
    task = current_user.tasks.find(params[:id])
    task.collaborators << user
    PrivatePub.publish_to("/users/#{user.id}", :title => task.title,
                                         :description => task.description,
                                               :owner => task.user.email)
    respond_to do |format|
      format.html { redirect_to :action => :index }
      format.json { head :no_content }
    end
  end
end

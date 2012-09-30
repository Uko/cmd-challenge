class TasksController < ApplicationController
  before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks + current_user.shared_tasks

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
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
    
  end
  
  #POST /tasks/1/share.json
  def share
    user = User.find_by_email(params[:user][:email])
    puts user
    current_user.tasks.find(params[:id]).collaborators << user
    
    redirect_to :action => :index

#   format.json { render json: @task, status: :created, location: @task }
  end
end

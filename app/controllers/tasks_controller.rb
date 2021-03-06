class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]
    
    
def index
    @tasks = Task.all
end
# GET /tasks/1

def show
end

def create  
    @task = Task.new(task_params)  
    if @task.save    
      render :show, status: :created, location: @task  
    else    
      render json: @task.errors, status: :unprocessable_entity  
    end
end

def update  
    if @task.update(task_params)    
       render :show, status: :ok, location: @task  
    else    
        render json: @task.errors, status: :unprocessable_entity  
    end
end 
def destroy  
    @task.destroy
end    
    
    
  private
    def set_task   
       @task = Task.find(params[:id])
    end
    def task_params
     params.require(:task).permit(:title, :description, :finished)
    end  
    
    
end

class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        user = current_user
        task = user.task.build(task_params)
        task.save
        redirect_to task_path(task)
    end

    def show
        @task = Task.find(params[:id])
    end

    private

    def task_params
        params.require(:task).permit(:title, :description)
    end

end

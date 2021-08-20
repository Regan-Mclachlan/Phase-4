class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        user = current_user
        task = user.groups.tasks.build(task_params)
        task.save
        redirect_to task_path(task)
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to @task
        else
            render :edit
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :status)
    end

end

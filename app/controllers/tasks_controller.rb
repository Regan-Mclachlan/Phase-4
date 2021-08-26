class TasksController < ApplicationController
    def index
        @task_groups = current_user.groups
    end
    def new
        @task = Task.new
    end

    def create
        # user = current_user
        task = Task.create(task_params)
        # task.save
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

    def add_group_to_task
        @groups = Group.all
        puts params.inspect
        @group = Group.find_by(group_type: params["task"]["group"])
        p group
        @task = Task.find(params[:id])
        if @task.groups.include?(group)
            redirect_to @task, notice: "This group has already been assigned"
        else
            @task.group << group
            redirect_to @task
        end
    end

    private

    def task_params
        params.require(:task).permit(:title, :description, :status, groups_id: [] )
    end

end

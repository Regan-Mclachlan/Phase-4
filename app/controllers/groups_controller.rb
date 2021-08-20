class GroupsController < ApplicationController
    def new
        @group = Group.new
    end

    def create
        user = current_user
        group = user.groups.new(group_params)
        group.save
        redirect_to groups_path(group)
    end


    def show
        @group = Group.find(params[:id])
    end

    def index
        if params[:user_id]
            user = User.find[:user_id]
            @groups = user.groups
        else 
            @groups = Group.all
        end
    end

    def edit
        @group = Group.find(params[:id])
    end

    def update
        @group = Group.find(params[:id])

        if @group.update(group_params)
            redirect_to @group
        else
            render :edit
        end

    end

    def all_users
        @@users = User.all
    end

    # def add_users_to_group
    #     @group = Group.find(params[:id])
        
    # end

    def add_user_to_group
        puts params.inspect
        user = User.find_by(email: params["group"]["users"])
        p user
        @group = Group.find(params[:id])
        if @group.users.include?(user)
            redirect_to @group, notice: "You are already in this group"
        else
            @group.users << user
            redirect_to @group
        end
    end

    def delete

    end

    private
    def group_params
        params.require(:group).permit(:group_type, :users)
    end
end

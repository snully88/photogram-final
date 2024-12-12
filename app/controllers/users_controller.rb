class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end


  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def create
    the_user = User.new
    the_user.email = params.fetch("query_email")
    the_user.password = params.fetch("query_password")
    the_user.username = params.fetch("query_username")
    the_user.private = params.fetch("query_private")

    if the_user.valid?
      the_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users/sign_up", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)


    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.id}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/users", { :notice => "User deleted successfully."} )
  end

  def profile
    the_user = params.fetch("username")

    matching_users = User.where({ :username => the_user })
    @the_user = matching_users.at(0)

    #followers_count = FollowRequest.where(recipient_id: the_user.id).count
    #following_count = FollowRequest.where(sender_id: the_user.id).count
    render({ :template => "users/profile" })
  end

end

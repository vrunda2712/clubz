class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def show
    require_login

    @club  = Club.find(params[:id])

    require_ownership_or_role

  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(
      name: params[:club][:name],
      description: params[:club][:description],
      user: current_user
    )

    if @club.save
      redirect_to root_path
    else
      flash.now[:alert] = @club.errors.full_messages
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])

    if @club && @club.update(name: params[:club][:name], description: params[:club][:description], user: current_user)
      redirect_to root_path
    else
      flash.now[:alert] = @club.errors.full_messages
      render :edit
    end
  end

  private
  def require_login
    unless current_user
      flash[:alert] = ["Must be logged in to enter club"]
      redirect_to root_path
    end
  end

  def require_ownership_or_role
    unless User::ALLOWED_ROLES.include?(current_user.role)
      unless current_user.clubs.include?(@club)
        flash[:alert] = ["No!!"]
        redirect_to root_path
      end
    end
  end
end

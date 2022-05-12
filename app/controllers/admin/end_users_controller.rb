class Admin::EndUsersController < ApplicationController
  def index
  end

  def show
    @end_user = current_end_user
  end

  def edit
  end
end

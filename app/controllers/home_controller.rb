class HomeController < ApplicationController
  def index
    @posts  = Post.all  
    @categories = Category.all
  end
  def category
    @categories = Category.all
  end
  def profile
    if @person = Person.where(user_id: current_user.id).first
      @person = Person.where(user_id: current_user.id).first
    else  
        redirect_to new_person_path
    end
  end
end

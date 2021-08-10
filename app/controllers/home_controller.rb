class HomeController < ApplicationController

  def remove_checked_items
    puts params
    @list = List.all
    # @list = list.where()
    @trash = @list.where(:completed => true).destroy_all
    redirect_to root_url, notice: "All marked items have been successfully removed."
  end
  
end
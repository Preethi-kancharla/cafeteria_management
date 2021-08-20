class MenusController < ApplicationController
    def index
        render plain: Menu.all.to_a.map { |menu| menu.name }.join("\n")
    end
    
    def show
      render plain: Menu.find(params[:id]).name
    end
end

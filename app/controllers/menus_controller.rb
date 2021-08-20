class MenusController < ApplicationController
    def index
        render plain: Menu.all.to_a.map { |menu| menu.name }.join("\n")
    end
    
    def show
      render plain: Menu.find(params[:id]).name
    end

    def new
    end

    def edit
        @menu = Menu.find(params[:id])
    end

    def update
        menu = Menu.find(params[:id])
        puts "params #{params[:name]}"
        menu.update(name: params[:name].capitalize)
        if menu.save
          redirect_to(menus_path, notice: "#{menu.name} menu updated successfully!")
        else
          flash[:error] = menu.errors.full_messages
          redirect_to edit_menu_path
        end
    end

    def create
        menu = Menu.create!(name: params[:name].capitalize)
        render plain: "created #{menu.name} with #{menu.id}"
    end

    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy!
        redirect_to menus_path
    end
end

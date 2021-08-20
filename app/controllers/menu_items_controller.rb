class MenuItemsController < ApplicationController
    def index
        render plain: MenuItem.all.to_a.map { |item| item.name }.join("\n")
    end

    def show
        render plain: MenuItem.find(params[:id]).name
    end

    def new
    end

    def create
        if params[:menu_name].nil?
          flash[:alert] = "Please select menu first!"
          redirect_to menus_path
        else
          menu = Menu.check_menu_exists_create_if_not(params[:menu_name])
          menu.save
          menu_item = MenuItem.new(name: params[:name].capitalize,
                                   description: params[:description].capitalize,
                                   menu_id: menu.id,
                                   price: params[:price])
          
          if menu.save && menu_item.save
            redirect_to(menu_items_path, notice: "#{menu_item.name} item added successfully!")
          else
            flash[:error] = menu_item.errors.full_messages + menu.errors.full_messages
            redirect_to menus_path
          end
        end
    end

    def edit
      @menu_item = MenuItem.find(params[:id])
      menuid=@menu_item.menu_id
      @menu=Menu.find(menuid)
    end
  
    def update
      menu = Menu.check_menu_exists_create_if_not(params[:menu_name])
      menu.save
      menu_item = MenuItem.find(params[:id])
      menu_item.update(name: params[:name].capitalize,
                       description: params[:description].capitalize,
                       menu_id: menu.id,
                       price: params[:price])
      if menu.save && menu_item.save
        redirect_to(menus_path, notice: "#{menu_item.name} item updated successfully!")
      else
        flash[:error] = menu_item.errors.full_messages + menu.errors.full_messages
        redirect_to edit_menu_item_path
      end
    end

    def destroy
      @menu_item = MenuItem.find(params[:id])
      @menu_item.destroy!
      edirect_to menu_items_path
    end

end

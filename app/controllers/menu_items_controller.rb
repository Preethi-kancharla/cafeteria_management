class MenuItemsController < ApplicationController
    def index
        render plain: MenuItem.all.to_a.map { |item| item.name }.join("\n")
    end

    def show
        render plain: MenuItem.find(params[:id]).name
    end
end

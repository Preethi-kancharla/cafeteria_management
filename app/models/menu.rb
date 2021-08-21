class Menu < ApplicationRecord
    has_many :menu_items, dependent: :destroy
    validates :name, presence: true, length: { in: 3..25 }, uniqueness: true
    def self.check_menu_exists_create_if_not(menu_name)
        menus=Menu.all.to_a
        menus.each do |menu|
            if menu.name==menu_name
                return find(menu.id) 
            end
        end
        return Menu.new(name: menu_name.capitalize)

    end
    
    def self.active
        all.where("active = ?", true)
    end

end
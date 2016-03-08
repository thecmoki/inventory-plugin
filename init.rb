Redmine::Plugin.register :regjistrimi_inventarit do
  name 'Regjistrimi Inventarit plugin'
  author 'AdaptivIT'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :regjistrimi_inventarit do
    permission(:regjistrimi_inventarit, {:units => [:index, :show, :edit, :new, :create, :update, :destroy],
  									                     :inventories => [:index, :show, :edit, :new, :create, :update, :destroy],
                                         :histories => [:index],
								                         :rooms => [:index, :show, :edit, :new, :create, :update, :destroy],
                                         :amortnorms => [:index, :show, :edit, :new, :create, :update, :destroy],
  									                     :categories => [:index, :show, :edit, :new, :create, :update, :destroy]})
    menu(:project_menu, :regjistrimi_inventarit, {:controller => "inventories", :action => "index"},
  						:caption => "Inventory", :after => :activity, :param => :project_id, :class => "activity")
  end
end
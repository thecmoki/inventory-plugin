Redmine::Plugin.register :regjistrimi_inventarit do
  name 'Regjistrimi Inventarit plugin'
  author 'AdaptivIT'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
  permission(:regjistrimi_inventarit, {:stocks => [:index, :show, :edit, :new, :create, :update, :destroy],
  									   :units => [:index, :show, :edit, :new, :create, :update, :destroy],
  									   :inventories => [:index, :show, :edit, :new, :create, :update, :destroy],
  									   :rooms => [:index, :show, :edit, :new, :create, :update, :destroy],
  									   :categories => [:index, :show, :edit, :new, :create, :update, :destroy]},
  									   :public => true)
  menu(:project_menu, :regjistrimi_inventarit, {:controller => "stocks", :action => "index"},
  						:caption => "AdaptivIT", :after => :activity, :param => :project_id)
end
# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get("projects/:project_id/units" => "units#index", :as => "units")
get("projects/:project_id/units/new" => "units#new", :as => "units_new")
post("projects/:project_id/units" => "units#create")
get("projects/:project_id/units/:id" => "units#show", :as => "units_show")
get("projects/:project_id/units/:id/edit" => "units#edit", :as => "units_edit")
post("projects/:project_id/units/update" => "units#update")
delete("projects/:project_id/units/:id/destroy" => "units#destroy", :as => "units_destroy")

get("projects/:project_id/inventories" => "inventories#index", :as => "inventories")
get("projects/:project_id/inventories/new" => "inventories#new", :as => "inventories_new")
post("projects/:project_id/inventories" => "inventories#create")
get("projects/:project_id/inventories/:id" => "inventories#show", :as => "inventories_show")
get("projects/:project_id/inventories/:id/edit" => "inventories#edit", :as => "inventories_edit")
post("projects/:project_id/inventories/update" => "inventories#update")
delete("projects/:project_id/inventories/:id/destroy" => "inventories#destroy", :as => "inventories_destroy")
post("projects/:project_id/inventories/search" => "inventories#index", :as => "search_inventories")

get("projects/:project_id/categories" => "categories#index", :as => "categories")
get("projects/:project_id/categories/new" => "categories#new", :as => "categories_new")
post("projects/:project_id/categories" => "categories#create")
get("projects/:project_id/categories/:id" => "categories#show", :as => "categories_show")
get("projects/:project_id/categories/:id/edit" => "categories#edit", :as => "categories_edit")
post("projects/:project_id/categories/update" => "categories#update")
delete("projects/:project_id/categories/:id/destroy" => "categories#destroy", :as => "categories_destroy")

get("projects/:project_id/rooms" => "rooms#index", :as => "rooms")
get("projects/:project_id/rooms/new" => "rooms#new", :as => "rooms_new")
post("projects/:project_id/rooms" => "rooms#create")
get("projects/:project_id/rooms/:id" => "rooms#show", :as => "rooms_show")
get("projects/:project_id/rooms/:id/edit" => "rooms#edit", :as => "rooms_edit")
post("projects/:project_id/rooms/update" => "rooms#update")
delete("projects/:project_id/rooms/:id/destroy" => "rooms#destroy", :as => "rooms_destroy")
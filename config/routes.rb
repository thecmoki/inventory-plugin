# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get("stocks" => "stocks#index")
get("stocks/new")
post("stocks" => "stocks#create")
get("stocks/:id" => "stocks#show")
get("stocks/:id/edit" => "stocks#edit")
post("stocks/update")
delete("stocks/:id/destroy" => "stocks#destroy")

<<<<<<< HEAD
get("units/new")
get("units" => "units#index")
get("units/:id" => "units#show")
get("units/:id/edit" => "units#edit")
post("units/update")

post("units" => "units#create")
delete("units/:id/destroy" => "units#destroy")
=======
get("inventories" => "inventories#index")
get("inventories/new")
post("inventories" => "inventories#create")
get("inventories/:id" => "inventories#show")
get("inventories/:id/edit" => "inventories#edit")
post("inventories/update")
delete("inventories/:id/destroy" => "inventories#destroy")

get("categories" => "categories#index")
get("categories/new")
post("categories" => "categories#create")
get("categories/:id" => "categories#show")
get("categories/:id/edit" => "categories#edit")
post("categories/update")
delete("categories/:id/destroy" => "categories#destroy")
>>>>>>> aeafaf983001a864d443b604214411c8778b7070

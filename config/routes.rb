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

=======
>>>>>>> 50d2697774b45d7ac9272cd13a04e2d1c50a9607
get("units/new")
get("units" => "units#index")
get("units/:id" => "units#show")
get("units/:id/edit" => "units#edit")
post("units/update")

post("units" => "units#create")
delete("units/:id/destroy" => "units#destroy")
<<<<<<< HEAD

=======
>>>>>>> 50d2697774b45d7ac9272cd13a04e2d1c50a9607
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

<<<<<<< HEAD
=======
get("rooms/new")
post("rooms" => "rooms#create")
get("rooms" => "rooms#index")
get("rooms/:id" => "rooms#show")
get("rooms/:id/edit" => "rooms#edit")
post("rooms/update")
delete("rooms/:id/destroy" => "rooms#destroy")
>>>>>>> 50d2697774b45d7ac9272cd13a04e2d1c50a9607

# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get("stocks" => "stocks#index")
get("stocks/new")
post("stocks" => "stocks#create")
get("stocks/:id" => "stocks#show")
get("stocks/:id/edit" => "stocks#edit")
post("stocks/update")
delete("stocks/:id/destroy" => "stocks#destroy")

get("units/new")
get("units" => "units#index")
get("units/:id" => "units#show")
get("units/:id/edit" => "units#edit")
post("units/update")

post("units" => "units#create")
delete("units/:id/destroy" => "units#destroy")
# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get("stocks" => "stocks#index")
get("stocks/new")
post("stocks" => "stocks#create")
get("stocks/:id" => "stocks#show")
get("stocks/:id/edit" => "stocks#edit")
post("stocks/update")
delete("stocks/:id/destroy" => "stocks#destroy")
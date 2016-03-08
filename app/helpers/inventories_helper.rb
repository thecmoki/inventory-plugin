module InventoriesHelper
	# Keto metoda jane brenda index.html.erb
	def addInventory(lan = "en")
		if(lan == "en")
			"New Inventory"
		elsif(lan == "al")
			"Shto Inventar"
		end
	end
	def editInventory(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	def deleteInventory(lan = "en")
		if(lan == "en")
			"Delete"
		elsif(lan == "al")
			"Fshi"
		end
	end
	def inventoryHeader(lan = "en")
		if(lan == "en")
			"Inventories"
		elsif(lan == "al")
			"Inventaret"
		end
	end
	def inventoryLegend3(lan = "en")
		if(lan == "en")
			"Filters"
		elsif(lan == "al")
			"Filtrimi"
		end
	end
	def inventoryApply(lan = "en")
		if(lan == "en")
			"Apply"
		elsif(lan == "al")
			"Kerko"
		end
	end
	def inventoryClear(lan = "en")
		if(lan == "en")
			"Clear"
		elsif(lan == "al")
			"Pastro"
		end
	end
	def dataConfirm(lan = "en")
		if(lan == "en")
			{ confirm: 'Are you sure?' }
		elsif(lan == "al")
			{ confirm: 'A jeni te sigurt?' }
		end
	end
	def goCategories(lan = "en")
		if(lan == "en")
			"Categories"
		elsif(lan == "al")
			"Kategorit"
		end
	end
	def goUnits(lan = "en")
		if(lan == "en")
			"Products"
		elsif(lan == "al")
			"Produktet"
		end
	end
	def goRooms(lan = "en")
		if(lan == "en")
			"Rooms"
		elsif(lan == "al")
			"Dhomat"
		end
	end
	def goAmortNorms(lan = "en")
		if(lan == "en")
			"Amortization Norms"
		elsif(lan == "al")
			"Normat e Amortizimit"
		end
	end
	def goHistories(lan = "en")
		if(lan == "en")
			"History"
		elsif(lan == "al")
			"Historia"
		end
	end
	#keto metoda jane brenda edit.html.erb
	def inventoryPathEdit(lan = "en")
		if(lan == "en")
			link_to("Inventories", inventories_path) + " » Edit Inventory"
		elsif(lan == "al")
			link_to("Inventaret", inventories_path) + " » Ndrysho Inventar"
		end
	end
	def inventoryEditSubmit(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	#keto metoda jane brenda new.html.erb
	def inventoryPathNew(lan = "en")
		if(lan == "en")
			link_to("Inventories", inventories_path) + " » New Inventory"
		elsif(lan == "al")
			link_to("Inventaret", inventories_path) + " » Krijo Inventar"
		end
	end
	def inventoryNewSubmit(lan = "en")
		if(lan == "en")
			"Create"
		elsif(lan == "al")
			"Krijo"
		end
	end
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def inventoryLegend1(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def inventoryLegend2(lan = "en")
		if(lan == "en")
			"Information"
		elsif(lan == "al")
			"Informacionet"
		end
	end
	def userName(lan = "en")
		if(lan == "en")
			"User Name"
		elsif(lan == "al")
			"Emri i Perdoruesit"
		end
	end
	def userLogin(lan = "en")
		if(lan == "en")
			"User Login"
		elsif(lan == "al")
			"Qasja e Perdoruesit"
		end
	end
	def roomName(lan = "en")
		if(lan == "en")
			"Room Name"
		elsif(lan == "al")
			"Emri i Dhomes"
		end
	end
	def productName(lan = "en")
		if(lan == "en")
			"Product Name"
		elsif(lan == "al")
			"Emri i Produktit"
		end
	end
	def serialNumber(lan = "en")
		if(lan == "en")
			"Serial Number"
		elsif(lan == "al")
			"Numri Serik"
		end
	end
	def buyDate(lan = "en")
		if(lan == "en")
			"Buy Date"
		elsif(lan == "al")
			"Data e Blerjes"
		end
	end
	def activationDate(lan = "en")
		if(lan == "en")
			"Activation Date"
		elsif(lan == "al")
			"Data e Aktivizimit"
		end
	end
	def amortizationNorm(lan = "en")
		if(lan == "en")
			"Amortization Norm"
		elsif(lan == "al")
			"Norma e Amortizimit"
		end
	end
	def amortization(lan = "en")
		if(lan == "en")
			"Amortization"
		elsif(lan == "al")
			"Amortizimi"
		end
	end
	def netoValue(lan = "en")
		if(lan == "en")
			"Neto Value"
		elsif(lan == "al")
			"Vlera Neto"
		end
	end
	def timeOfUse(lan = "en")
		if(lan == "en")
			"Time Of Use"
		elsif(lan == "al")
			"Koha e Perdorimit"
		end
	end
	def comment(lan = "en")
		if(lan == "en")
			"Comment"
		elsif(lan == "al")
			"Komenti"
		end
	end
	def productId(lan = "en")
		if(lan == "en")
			"Product Id"
		elsif(lan == "al")
			"Id e Produktit"
		end
	end
end
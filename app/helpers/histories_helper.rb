module HistoriesHelper
	# Keto metoda jane brenda index.html.erb
	def historyHeader(lan = "en")
		if(lan == "en")
			"History"
		elsif(lan == "al")
			"Historia"
		end
	end
	def historyLegend3(lan = "en")
		if(lan == "en")
			"Filters"
		elsif(lan == "al")
			"Filtrimi"
		end
	end
	def historyApply(lan = "en")
		if(lan == "en")
			"Apply"
		elsif(lan == "al")
			"Kerko"
		end
	end
	def historyClear(lan = "en")
		if(lan == "en")
			"Clear"
		elsif(lan == "al")
			"Pastro"
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
	def goInventories(lan = "en")
		if(lan == "en")
			"Inventories"
		elsif(lan == "al")
			"Inventaret"
		end
	end
	
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def historyLegend1(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def historyLegend2(lan = "en")
		if(lan == "en")
			"Information"
		elsif(lan == "al")
			"Informacionet"
		end
	end
	def inventoryId(lan = "en")
		if(lan == "en")
			"InvID"
		elsif(lan == "al")
			"IDInv"
		end
	end 
	def productId(lan = "en")
		if(lan == "en")
			"Prod. ID"
		elsif(lan == "al")
			"ID e Prod."
		end
	end 
	def userName(lan = "en")
		if(lan == "en")
			"User Name"
		elsif(lan == "al")
			"Perdoruesi"
		end
	end
	def userLogin(lan = "en")
		if(lan == "en")
			"Login"
		elsif(lan == "al")
			"Login"
		end
	end
	def roomName(lan = "en")
		if(lan == "en")
			"Room"
		elsif(lan == "al")
			"Dhoma"
		end
	end
	def productName(lan = "en")
		if(lan == "en")
			"Product"
		elsif(lan == "al")
			"Produkti"
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
	def createdAt(lan = "en")
		if(lan == "en")
			"Created At"
		elsif(lan == "al")
			"Krijuar Me"
		end
	end
	def updatedAt(lan = "en")
		if(lan == "en")
			"Updated At"
		elsif(lan == "al")
			"Ndryshuar Me"
		end
	end
end
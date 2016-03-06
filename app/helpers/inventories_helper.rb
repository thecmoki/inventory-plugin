module InventoriesHelper
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
	def addInventory(lan = "en")
		if(lan == "en")
			"New Inventory"
		elsif(lan == "al")
			"Inventar i Ri"
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
			"Fshije"
		end
	end
end
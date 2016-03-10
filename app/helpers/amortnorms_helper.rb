module AmortnormsHelper
	# Keto metoda jane brenda index.html.erb
	def addAmortnorm(lan = "en")
		if(lan == "en")
			"New Amortization Norm"
		elsif(lan == "al")
			"Shto Norm te Amortizimit"
		end
	end
	def editAmortnorm(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	def deleteAmortnorm(lan = "en")
		if(lan == "en")
			"Delete"
		elsif(lan == "al")
			"Fshi"
		end
	end
	def amortnormHeader(lan = "en")
		if(lan == "en")
			"Amortization Norms"
		elsif(lan == "al")
			"Normat e Amortizimit"
		end
	end
	def dataConfirm(lan = "en")
		if(lan == "en")
			{ confirm: 'Are you sure?' }
		elsif(lan == "al")
			{ confirm: 'A jeni te sigurt?' }
		end
	end
	#keto metoda jane brenda edit.html.erb
	def amortnormPathEdit(lan = "en")
		if(lan == "en")
			link_to("Amortization Norms", amortnorms_path) + " » Edit Amort Norm"
		elsif(lan == "al")
			link_to("Normat e Amortizimit", amortnorms_path) + " » Ndrysho Normen e Amortizimit"
		end
	end
	def amortnormEditSubmit(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
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
	#keto metoda jane brenda new.html.erb
	def amortnormPathNew(lan = "en")
		if(lan == "en")
			link_to("Amortization Norms", amortnorms_path) + " » New Amort Norm"
		elsif(lan == "al")
			link_to("Normat e Amortizimit", amortnorms_path) + " » Krijo Norm te Amortizimit"
		end
	end
	def amortnormNewSubmit(lan = "en")
		if(lan == "en")
			"Create"
		elsif(lan == "al")
			"Krijo"
		end
	end
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def amortnormLegend(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def amortnormName(lan = "en")
		if(lan == "en")
			"Amortization Norm"
		elsif(lan == "al")
			"Normes se Amortizimit"
		end
	end
	def amortnormComment(lan = "en")
		if(lan == "en")
			"Amortization Norm Comment"
		elsif(lan == "al")
			"Komenti i Normes se Amortizimit"
		end
	end
end
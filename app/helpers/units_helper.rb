module UnitsHelper
	# Keto metoda jane brenda index.html.erb
	def addProduct(lan = "en")
		if(lan == "en")
			"New Product"
		elsif(lan == "al")
			"Shto Produkt"
		end
	end
	def editProduct(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	def deleteProduct(lan = "en")
		if(lan == "en")
			"Delete"
		elsif(lan == "al")
			"Fshi"
		end
	end
	def productHeader(lan = "en")
		if(lan == "en")
			"Products"
		elsif(lan == "al")
			"Produktet"
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
	def productPathEdit(lan = "en")
		if(lan == "en")
			link_to("Products", units_path) + " » Edit Product"
		elsif(lan == "al")
			link_to("Produktet", units_path) + " » Ndrysho Produktin"
		end
	end
	def productEditSubmit(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	#keto metoda jane brenda new.html.erb
	def productPathNew(lan = "en")
		if(lan == "en")
			link_to("Products", units_path) + " » New Product"
		elsif(lan == "al")
			link_to("Produktet", units_path) + " » Krijo Produkt"
		end
	end
	def productNewSubmit(lan = "en")
		if(lan == "en")
			"Create"
		elsif(lan == "al")
			"Krijo"
		end
	end
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def productLegend1(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def productLegend2(lan = "en")
		if(lan == "en")
			"Information"
		elsif(lan == "al")
			"Inormacion"
		end
	end
	def productName(lan = "en")
		if(lan == "en")
			"Product Name"
		elsif(lan == "al")
			"Emri i Produktit"
		end
	end
	def productComment(lan = "en")
		if(lan == "en")
			"Product Comment"
		elsif(lan == "al")
			"Komenti i Produktit"
		end
	end
	def productCategoryId(lan = "en")
		if(lan == "en")
			"Category"
		elsif(lan == "al")
			"Kategoria"
		end
	end
	def productQuantity(lan = "en")
		if(lan == "en")
			"Quantity"
		elsif(lan == "al")
			"Sasia"
		end
	end
	def productColor(lan = "en")
		if(lan == "en")
			"Color"
		elsif(lan == "al")
			"Ngjyra"
		end
	end
end
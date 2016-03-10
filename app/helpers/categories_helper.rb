module CategoriesHelper
	# Keto metoda jane brenda index.html.erb
	def addCategory(lan = "en")
		if(lan == "en")
			"New Category"
		elsif(lan == "al")
			"Shto Kategori"
		end
	end
	def editCategory(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	def deleteCategory(lan = "en")
		if(lan == "en")
			"Delete"
		elsif(lan == "al")
			"Fshi"
		end
	end
	def categoryHeader(lan = "en")
		if(lan == "en")
			"Categories"
		elsif(lan == "al")
			"Kategorit"
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
	def goInventories(lan = "en")
		if(lan == "en")
			"Inventories"
		elsif(lan == "al")
			"Inventaret"
		end
	end
	#keto metoda jane brenda edit.html.erb
	def categoryPathEdit(lan = "en")
		if(lan == "en")
			link_to("Categories", categories_path) + " » Edit Category"
		elsif(lan == "al")
			link_to("Kategorit", categories_path) + " » Ndrysho Kategori"
		end
	end
	def categoryEditSubmit(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	#keto metoda jane brenda new.html.erb
	def categoryPathNew(lan = "en")
		if(lan == "en")
			link_to("Categories", categories_path) + " » New Category"
		elsif(lan == "al")
			link_to("Kategorit", categories_path) + " » Krijo Kategori"
		end
	end
	def categoryNewSubmit(lan = "en")
		if(lan == "en")
			"Create"
		elsif(lan == "al")
			"Krijo"
		end
	end
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def categoryLegend(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def categoryName(lan = "en")
		if(lan == "en")
			"Category Name"
		elsif(lan == "al")
			"Emri i Kategoris"
		end
	end
	def categoryComment(lan = "en")
		if(lan == "en")
			"Category Comment"
		elsif(lan == "al")
			"Komenti i Kategoris"
		end
	end
end
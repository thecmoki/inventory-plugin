module CategoriesHelper
	def name(lan = "en")
		if(lan == "en")
			"Name"
		elsif(lan == "al")
			"Emri"
		end
	end
	def comment(lan = "en")
		if(lan == "en")
			"Comment"
		elsif(lan == "al")
			"Komenti"
		end
	end
end
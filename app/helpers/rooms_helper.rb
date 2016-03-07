module RoomsHelper
	# Keto metoda jane brenda index.html.erb
	def addRoom(lan = "en")
		if(lan == "en")
			"New Room"
		elsif(lan == "al")
			"Shto Dhome"
		end
	end
	def editRoom(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	def deleteRoom(lan = "en")
		if(lan == "en")
			"Delete"
		elsif(lan == "al")
			"Fshi"
		end
	end
	def roomHeader(lan = "en")
		if(lan == "en")
			"Rooms"
		elsif(lan == "al")
			"Dhomat"
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
	def roomPathEdit(lan = "en")
		if(lan == "en")
			link_to("Rooms", rooms_path) + " » Edit Room"
		elsif(lan == "al")
			link_to("Dhomat", rooms_path) + " » Ndrysho Dhomen"
		end
	end
	def roomEditSubmit(lan = "en")
		if(lan == "en")
			"Edit"
		elsif(lan == "al")
			"Ndrysho"
		end
	end
	#keto metoda jane brenda new.html.erb
	def roomPathNew(lan = "en")
		if(lan == "en")
			link_to("Rooms", rooms_path) + " » New Room"
		elsif(lan == "al")
			link_to("Dhomat", rooms_path) + " » Krijo Dhomen"
		end
	end
	def roomNewSubmit(lan = "en")
		if(lan == "en")
			"Create"
		elsif(lan == "al")
			"Krijo"
		end
	end
	#keto metoda jane brenda new.html.erb dhe edit.html.erb dhe index.html.erb
	def roomLegend(lan = "en")
		if(lan == "en")
			"Required"
		elsif(lan == "al")
			"Te Nevojshme"
		end
	end
	def roomName(lan = "en")
		if(lan == "en")
			"Room Name"
		elsif(lan == "al")
			"Emri i Dhomes"
		end
	end
	def roomComment(lan = "en")
		if(lan == "en")
			"Room Comment"
		elsif(lan == "al")
			"Komenti i Dhomes"
		end
	end
end
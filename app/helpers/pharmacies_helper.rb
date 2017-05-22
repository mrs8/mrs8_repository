module PharmaciesHelper
	def options_for_pharm()
		Medicine.all.pluck(:medicine_name, :id)
	end
end

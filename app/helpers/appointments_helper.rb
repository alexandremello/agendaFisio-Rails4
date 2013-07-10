module AppointmentsHelper

	def username
		if self.user
			self.user.email
		else
			'No user'
		end
	end

end

class TodoItem < ActiveRecord::Base
	def self.numberCompleted
		return self.where(completed: true).count
	end
end

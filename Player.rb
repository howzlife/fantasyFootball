class Player

	def initialize(position, name, ppg, gp, matchup, salary, pm, expPoints, dpp)
		@position = position
		@name = name
		@ppg = ppg
		@gp = gp
		@matchup = matchup
		@salary = salary
		@pm = pm
		@expPoints = expPoints
		@dpp = dpp
	end

	def toString() 
		return "#{@position} #{@name} #{@ppg} #{@gp} #{@matchup} #{@salary} #{@pm} #{@expPoints} #{@dpp}"
	end

	def getSalary() 
		return @salary.gsub(/\D/,'').to_i
	end

end
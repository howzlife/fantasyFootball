require './Player.rb'

class Roster
	def initialize(qb, rb1, rb2, wr1, wr2, wr3, te)
		@qb = qb
		@rb1 = rb1
		@rb2 = rb2
		@wr1 = wr1
		@wr2 = wr2
		@wr3 = wr3
		@te = te
		$MAXSALARY = 50000
	end
end
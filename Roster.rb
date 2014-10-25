require 'Player.rb'

class Roster
	def initialize(Player qb, Player rb1,Player rb2,Player wr1,Player wr2,Player wr3,Player te)
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
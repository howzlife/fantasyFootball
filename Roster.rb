require './Player.rb'

class Roster
	def initialize(qb, rb1, rb2, wr1, wr2, wr3, te)
		@qb = qb
		@rb1 = rb1
		@rb2 = rb2
		@wr1 = wr1
		@wr2 = wr2
		@wr3 = wr3
		@te1 = te
		@MAXSALARY = 50000
		#@totPoints = @qb.getPoints + @rb1.getPoints  + @rb2.getPoints + @wr1.getPoints  + @wr2.getPoints + @wr3.getPoints + @te1.getPoints 
		#@totSalary = @qb.getSalary() + @rb1.getSalary() + @rb2.getSalary() + @wr1.getSalary() + @wr2.getSalary() + @wr3.getSalary() + @te1.getSalary()
	end
	def print() 		# print values to screen
		puts @totSalary
		puts @qb.toString()
		puts @rb1.toString()
		puts @rb2.toString()
		puts @wr1.toString()
		puts @wr2.toString()
		puts @wr3.toString()
		puts @te1.toString()
		#puts "Max Salary: #{@MAXSALARY}"
		#puts "Expected Total: #{@totPoints}"
	end

	def validate()  #check that salary is under MAXSALARY
		return (@totSalary < @MAXSALARY)
	end
end
#Read CSV file with player info
require 'csv'
require "./Player.rb"
require "./data.rb"
require "./Roster.rb"
require "./helperMethods.rb"

#load players into hash
players = Hash.new
keys = ['position', 'name', 'ppg', 'gp', 'matchup', 'salary', 'exp+', 'expPts', 'dpp']
players = CSV.parse($data).map {|a| Hash[ keys.zip(a) ] }

#convert some elements to integer

players.each do |x|
	x["expPts"] = Float(x["expPts"])
	x["salary"] = Integer(x["salary"].gsub(/[^\d\.]/, '').to_f)
end

#load up positional arrays

wrArray = Array.new 
qbArray = Array.new 
rbArray = Array.new 
teArray = Array.new 


		players.each do |key|
			if (key["position"] == "WR")
				wrArray << key
			elsif (key["position"] == "QB")
				qbArray << key
			elsif (key["position"] == "RB")
				rbArray << key
			elsif (key["position"] == "TE")
				teArray << key
			end
		end

		wrArray.to_a
		qbArray.to_a
		rbArray.to_a
		teArray.to_a

		wrArray.sort_by! {|k| k["expPts"]}.reverse!
		qbArray.sort_by! {|k| k["expPts"]}.reverse!
		rbArray.sort_by! {|k| k["expPts"]}.reverse!
		teArray.sort_by! {|k| k["expPts"]}.reverse!

wrTrio = Array.new


wrTrio.each do |x|
	puts x
end








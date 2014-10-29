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





def findTrio(wrArray, maxSalary)
	wrTrio = Array.new
	bestScore = 0
	bestSalary = 0
	for i in 0..(wrArray.size - 3) do 

		for j in i+1..(wrArray.size - 2) do 

			for k in j+1..(wrArray.size-1) do

				if  Float(wrArray[i]["expPts"]) + Float(wrArray[j]["expPts"]) + Float(wrArray[k]["expPts"]) > bestScore && Float(wrArray[i]["salary"]) + Float(wrArray[j]["salary"]) + Float(wrArray[k]["salary"]) <= maxSalary
					bestScore = wrArray[i]["expPts"] + wrArray[j]["expPts"] + wrArray[k]["expPts"]
					bestSalary = wrArray[i]["salary"] + wrArray[j]["salary"] + wrArray[k]["salary"]
					wrTrio[0] = wrArray[i]
					wrTrio[1] = wrArray[j]
					wrTrio[2] = wrArray[k]
				end
				if Float(wrArray[i]["expPts"]) + Float(wrArray[j]["expPts"]) + Float(wrArray[k]["expPts"]) < bestScore
					break
				end
			end
				if Float(wrArray[i]["expPts"]) + Float(wrArray[j]["expPts"]) + Float(wrArray[j+1]["expPts"]) < bestScore
					break
				end
		end
			if Float(wrArray[i]["expPts"]) + Float(wrArray[i+1]["expPts"]) + Float(wrArray[i+2]["expPts"]) < bestScore
				break
			end
	end
	return wrTrio
end

def findTwo(rbArray, maxSalary)
	rbTwo = Array.new
	bestScore = 0
	bestSalary = 0
	for i in 0..(rbArray.size - 2) do 

		for j in i+1..(rbArray.size - 1) do 

				if  Float(rbArray[i]["expPts"]) + Float(rbArray[j]["expPts"]) > bestScore && Float(rbArray[i]["salary"]) + Float(rbArray[j]["salary"]) <= maxSalary
					bestScore = rbArray[i]["expPts"] + rbArray[j]["expPts"] 
					bestSalary = rbArray[i]["salary"] + rbArray[j]["salary"] 
					rbTwo[0] = rbArray[i]
					rbTwo[1] = rbArray[j]
				end

				if Float(rbArray[i]["expPts"]) + Float(rbArray[j]["expPts"]) < bestScore
					break
				end
		end

	if Float(rbArray[i]["expPts"]) + Float(rbArray[i+1]["expPts"]) < bestScore
		break
	end
	end
	return rbTwo
end

wrTrio = Array.new
rbTwo = Array.new


#Find best 2 Running Backs at all price points
j = 19600
while j >= 11000 do
	rbTwo.push(findTwo(rbArray, j))
	j = j - 200
end

#Find best 3 wr's at all price points
i = 26000
while i >= 17000 do
	wr3 = findTrio(wrArray, i)
	wrTrio.push(wr3)
	i = i - 200
end

def findBestRoster(maxSalary, qbArray, rbTwo, wrTrio, teArray)
bestScore = 0
for i in 0..(qbArray.size - 1)
	for j in 0..(wrTrio.size - 1)
			for k in 0..(rbTwo.size - 1)
					for l in (0..teArray.size - 1)
						if Float(qbArray[i]["expPts"]) + Float(wrTrio[j][0]["expPts"]) + Float(wrTrio[j][1]["expPts"]) + Float(wrTrio[j][2]["expPts"]) + Float(rbTwo[k][0]["expPts"]) + Float(rbTwo[k][1]["expPts"]) + Float(teArray[l]["expPts"]) > bestScore && Float(qbArray[i]["salary"]) + Float(wrTrio[j][0]["salary"]) + Float(wrTrio[j][1]["salary"]) + Float(wrTrio[j][2]["salary"]) + Float(rbTwo[k][0]["salary"]) + Float(rbTwo[k][1]["salary"]) + Float(teArray[l]["salary"]) <= maxSalary
							qb = qbArray[i]
							rb1 = rbTwo[k][0]
							rb2 = rbTwo[k][1]
							wr1 = wrTrio[j][0]
							wr2 = wrTrio[j][1]
							wr3 = wrTrio[j][2]
							te = teArray[l]
							totalSalary = Float(qbArray[i]["salary"]) + Float(wrTrio[j][0]["salary"]) + Float(wrTrio[j][1]["salary"]) + Float(wrTrio[j][2]["salary"]) + Float(rbTwo[k][0]["salary"]) + Float(rbTwo[k][1]["salary"]) + Float(teArray[l]["salary"]) 
							bestScore = Float(qbArray[i]["expPts"]) + Float(wrTrio[j][0]["expPts"]) + Float(wrTrio[j][1]["expPts"]) + Float(wrTrio[j][2]["expPts"]) + Float(rbTwo[k][0]["expPts"]) + Float(rbTwo[k][1]["expPts"]) + Float(teArray[l]["expPts"]) 
						end
					end	
			end
	end
end
puts bestScore
puts qb
puts rb1
puts rb2
puts wr1
puts wr2
puts wr3
puts te
puts "Total Salary: #{totalSalary}"
puts "Total Score: #{bestScore}"
end

x = 49000
while x <= 51000 do
	findBestRoster(x, qbArray, rbTwo, wrTrio, teArray)
	x += 400
end


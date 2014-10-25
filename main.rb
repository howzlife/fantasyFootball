#Read CSV file with player info
require 'csv'
require "./Player.rb"
require "./data.rb"

#load players into hash
players = Hash.new
keys = ['position', 'name', 'ppg', 'gp', 'matchup', 'salary', 'exp+', 'expPts', 'dpp']
players = CSV.parse($data).map {|a| Hash[ keys.zip(a) ] }

#set first qb
x = players.detect {|f| f["position"] == "QB" }
wr = players.detect {|f| f["position"] == "WR" }
wr2 = players.detect {|f| f["position"] == "WR"  && f["name"] != wr["name"]}
wr3= players.detect {|f| f["position"] == "WR" }
rb1 = players.detect {|f| f["position"] == "RB" }
rb2 = players.detect {|f| f["position"] == "RB" }
te = players.detect {|f| f["position"] == "RB" }

qb1 = Player.new(x["position"], x["name"], x["ppg"], x["gp"], x["matchup"], x["salary"], x["exp+"], x["expPts"], x["dpp"])

puts qb1.toString()

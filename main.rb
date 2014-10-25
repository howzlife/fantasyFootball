#Read CSV file with player info
require 'csv'
require "./Player.rb"
require "./data.rb"
require "./Roster.rb"

#load players into hash
players = Hash.new
keys = ['position', 'name', 'ppg', 'gp', 'matchup', 'salary', 'exp+', 'expPts', 'dpp']
players = CSV.parse($data).map {|a| Hash[ keys.zip(a) ] }

#set first qb
qb = players.detect {|f| f["position"] == "QB" && f["dpp"] < "500"}
wr1 = players.detect {|f| f["position"] == "WR"  && f["dpp"] < "500"}
wr2 = players.detect {|f| f["position"] == "WR"  && f["name"] != wr1["name"] && f["dpp"] < "500"}
wr3= players.detect {|f| f["position"] == "WR"  && f["name"] != wr1["name"] && f["name"] != wr2["name"] && f["dpp"] < "500"}
rb1 = players.detect {|f| f["position"] == "RB" && f["dpp"] <= "500" }
rb2 = players.detect {|f| f["position"] == "RB" && f["name"] != rb1["name"] && f["dpp"] <= "500" }
te = players.detect {|f| f["position"] == "TE" && f["dpp"] <= "600"}

qb1 = Player.new(qb["position"], qb["name"], qb["ppg"], qb["gp"], qb["matchup"], qb["salary"], qb["eqbp+"], qb["eqbpPts"], qb["dpp"])
wr1 = Player.new(wr1["position"], wr1["name"], wr1["ppg"], wr1["gp"], wr1["matchup"], wr1["salary"], wr1["exp+"], wr1["expPts"], wr1["dpp"])
wr2 = Player.new(wr2["position"], wr2["name"], wr2["ppg"], wr2["gp"], wr2["matchup"], wr2["salary"], wr2["exp+"], wr2["expPts"], wr2["dpp"])
wr3 = Player.new(wr3["position"], wr3["name"], wr3["ppg"], wr3["gp"], wr3["matchup"], wr3["salary"], wr3["exp+"], wr3["expPts"], wr3["dpp"])
rb1 = Player.new(rb1["position"], rb1["name"], rb1["ppg"], rb1["gp"], rb1["matchup"], rb1["salary"], rb1["exp+"], rb1["expPts"], rb1["dpp"])
rb2 = Player.new(rb2["position"], rb2["name"], rb2["ppg"], rb2["gp"], rb2["matchup"], rb2["salary"], rb2["exp+"], rb2["expPts"], rb2["dpp"])
te1 = Player.new(te["position"], te["name"], te["ppg"], te["gp"], te["matchup"], te["salary"], te["exp+"], te["expPts"], te["dpp"])

firstRoster = Roster.new(qb1, rb1, rb2, wr1, wr2, wr3, te1)

firstRoster.print()
puts firstRoster.validate()


local ID = "kalandra.kraken_game_over"

local Node = require("node")
local Choice = require("choice")

local node = Node:new(ID) ---@type Node
node.title = "Fim da aventura"
node.gameOver = true
node.description = "Um monstro enorme surge das profundezas e te puxa pra baixo. Você não teve chances."

return node

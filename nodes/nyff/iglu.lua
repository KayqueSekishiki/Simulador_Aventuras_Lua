local ID = "nyff.iglu"

local Node = require("node")
local Choice = require("choice")

local node = Node:new(ID) ---@type Node
node.title = "Montanhas de Nyff"
node.description = [[Foi difícil, mas você conseguiu construir um iglu com suas próprias mãos, e uma pá reserva que encontrou nas proximidades.

Depois de esperar a noite passar, você acorda com um vento forte e um frio que congela seus ossos. É uma nevasca!

Ficar no iglu não é mais uma opção. E agora?]]

table.insert(node.choices, Choice:new(
    "nyff.congelou",
    "Se esconder é a melhor opção, continuar no iglu até a nevasca passar."
))
table.insert(node.choices, Choice:new(
    "nyff.floresta",
    "Abandonar o iglu e ir para a floresta congelada."
))

return node
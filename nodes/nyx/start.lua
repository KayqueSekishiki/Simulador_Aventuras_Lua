local ID <const> = "nyx.start"

local Node = require("node")
local Choice = require("choice")

local node = Node:new(ID) ---@type Node
node.title = "Montanhas de Nyx"
node.description = "Está frio, a neve está por todo o lugar, e o silêncio é ensurdecedor. Para melhorar a situação, você percebe que esqueceu sua mochila em casa, e a única comida que lhe resta é uma batata do dia anterior."
node.header = [[
%{white}     /\
%{white}    /**\
%{white}   /****\   /\
%{white}  /      \ /**\
%{cyan}  /  /\    /    \    %{white}  /\  /\      /\       /\   /\/\/\  /\
%{cyan} /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \
%{cyan}/  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \
]]


return node
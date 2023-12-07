local ID <const> = "liones.start"

local Node = require("node")
local Choice = require("choice")

local node = Node:new(ID) ---@type Node
node.title = "Praia de Liones"
node.description = "As ondas dançam, a brisa voa, enquanto o Sol te acolhe com um calor agradável, este lugar é tão belo como dizem as lendas. Mas para a sua surpresa não tem mais ninguém aqui. Sua intuição diz que algo está errado."
node.header = [[
%{green}_\/_     %{yellow}            |            %{green}    _\/_
%{green}/o\\     %{yellow}        \       /        %{green}    //o\
%{green} |       %{yellow}          .---.          %{green}      |
%{green}_|_______%{yellow}     --  /     \  --     %{green}______|__
%{cyan }         %{      }`~^~^~^~^~^~^~^~^~^~^~^~`%{     }
]]



return node
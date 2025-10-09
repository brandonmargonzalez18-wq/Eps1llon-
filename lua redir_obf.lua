-- Script en LocalScript (debe ir en StarterPlayerScripts o PlayerGui)
-- ¡Este script SOLO funciona en el lado del cliente!

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- URL que quieres compartir (debe ser una URL permitida por Roblox)
local url = "https://www.roblox.com/share?code=9c01b9f0d829174daf43ea48723b5343&type=Server"

-- Mostrar notificación con el enlace
local success, err = pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "¡Visita nuestro sitio!",
        Text = "Haz clic en 'Aceptar' para abrir el enlace.",
        Duration = 6,
        Callback = function(btn)
            if btn == "OK" then
                -- Intentar abrir el enlace (solo si el jugador hace clic)
                game:GetService("HttpService"):GetAsync(url) -- Esto NO abre el navegador
                -- En su lugar, usamos OpenExternalUrl (requiere permisos)
                game:GetService("Players").LocalPlayer:SendExternalUrl(url)
            end
        end
    })
end)

if not success then
    warn("No se pudo mostrar la notificación:", err)
end

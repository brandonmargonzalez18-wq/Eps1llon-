-- Define la URL de Roblox a la que quieres redirigir.
local URL_DESTINO = "https://www.roblox.com/share?code=9c01b9f0d829174daf43ea48723b5343&type=Server"

-- Función para abrir la URL de forma segura.
-- En Roblox, usamos la función 'PromptOpenExternalLink'.
local function abrirEnlace()
    -- Obtenemos el servicio de juegos para acceder a funciones de la interfaz de usuario.
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Verificamos si la función existe para evitar errores en versiones antiguas o en otros entornos.
    if game.GuiService and game.GuiService.PromptOpenExternalLink then
        -- Esta función solicita al usuario permiso para abrir un enlace externo
        -- para garantizar la seguridad.
        game.GuiService:PromptOpenExternalLink(URL_DESTINO)
        print("Solicitando al jugador abrir el enlace: " .. URL_DESTINO)
    else
        -- Mensaje si el entorno no es Roblox o la función no está disponible.
        warn("No se pudo usar PromptOpenExternalLink. La URL es: " .. URL_DESTINO)
    end
end

-- Llamamos a la función para que se ejecute.
abrirEnlace()

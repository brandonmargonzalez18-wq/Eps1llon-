local TARGET_URL = "https://www.roblox.com/share?code=9c01b9f0d829174daf43ea48723b5343&type=Server"

-----------------------------------------------------------------------------


-- Función principal para ejecutar la redirección
local function perform_http_redirect()
    
    -- 2. Establece el código de estado HTTP 302 (Found - Redirección Temporal).
    -- Esto indica al navegador que debe buscar una nueva ubicación.
    ngx.status = 302 

    -- 3. Establece el encabezado 'Location'.
    -- El navegador lee este encabezado para saber a dónde ir.
    ngx.header["Location"] = TARGET_URL
    
    -- Opcional: Proporciona un cuerpo de respuesta con un enlace de respaldo.
    ngx.say('<html><body>')
    ngx.say('<p>Redireccionando a: <a href="' .. TARGET_URL .. '">Click aquí</a></p>')
    ngx.say('</body></html>')
    
    -- 4. Finaliza la solicitud HTTP.
    return ngx.exit(ngx.HTTP_OK)
end

-- Llama a la función (esto dependerá de la configuración específica de tu servidor).
-- perform_http_redirect()

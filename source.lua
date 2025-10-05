local TARGET_URL = "https://www.roblox.com/share?code=9c01b9f0d829174daf43ea48723b5343&type=Server"



Función principal para ejecutar la redirección
local function perform_http_redirect()



    ngx.status = 302 


   ngx.header["Location"] = TARGET_URL


   return ngx.exit(ngx.HTTP_OK)
end

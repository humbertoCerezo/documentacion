---- Filtra parches por version release VER PARCHES INSTALADOS EN BD --- Equipo\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Cadena Comercial OXXO, S.A. de C.V.\ REGEDIT
SELECT b.name as Release, a.CREATED_DATETIME as Instalado, a.DESCRIPTION + a.VERSION_CODE as Parche, b.IS_ACTIVE, * FROM [xposstore].dbo.[RELEASE_VERSION_CONTROL] a
INNER JOIN [xposstore].[dbo].[RELEASE]  B ON
A.RELEASE_ID = B.RELEASE_ID
where b.NAME >= '2.276.0.0'    
order by 2 asc
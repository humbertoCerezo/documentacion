USE [UserManager]

DECLARE

-- RELLENAR LOS SIGUIENTES CAMPOS
@CAJA_UNICA AS 
@CR_STORE AS NVARCHAR(10) = 'MONAJZPRO', -- COLOCAR EL CR DE PROCESOS | 'MONPHTPRO'
@IP_PRO AS NVARCHAR(20) = '10.217.24.120', -- COLOCAR IP DE PROCESOS
@MAC_PRO AS NVARCHAR(20) = 'C8-D9-D2-BA-25-5E', -- COLOCAR MAC DE PROCESOS

-- Si es caja única no llenar los siguientes campos
@IP_VT1 AS NVARCHAR(20) = '10.217.24.121',	-- COLOCAR IP VT1
@MAC_VT1 AS NVARCHAR(20) = '';	-- COLOCAR MAC DE VT1


--DELETE FROM NameMachine WHERE [Key] = @CR_STORE
--DELETE FROM StoreIps WHERE StoreIp = @IP_PRO
--DELETE FROM POSStoreIpMac = @MAC_PRO

		PRINT 'CONSULTA ANTES DEL DELETE';
		SELECT * FROM NameMachine where [key] = @CR_STORE
		SELECT * FROM StoreIps WHERE storeip = @IP_PRO AND Name = @CR_STORE
		SELECT * FROM POSStoreIpMac where Mac = @MAC_PRO

		SELECT * FROM POSStoreIpMac where StoreIp = '10.217.24.121'
/*
ELSE IF @CAJA_UNICA = 0
	BEGIN
		DELETE FROM NameMachine WHERE [key] = @CR_STORE
		DELETE FROM StoreIps WHERE storeip in (@IP_PRO, @IP_VT1) AND Name = @CR_STORE
		DELETE FROM POSStoreIpMac WHERE StoreIp = @IP_PRO
	END
*/

/*

Select * from StoreIps where ip in ('10.200.26.164','10.200.26.49')
Select * from POSStoreIpMac where Mac in ('30-9C-23-99-88-22','30-9C-23-99-88-19')



--Select * from POSStoreIpMac where StoreIp in ('10.200.26.164','10.200.26.49') --Select * from NameMachine where IdNameMachine in ('3772','3774')--- SOLO PROCESOS.
Select * from NameMachine where [key] = 'QRITGCPRO' delete from StoreIps where StoreIp in ('10.200.26.164','10.200.26.49')
delete from POSStoreIpMac where Mac in ('30-9C-23-99-88-22','30-9C-23-99-88-19')
delete from NameMachine where [key] = 'QRITGCPRO' delete from StoreIps where Ip in ('10.200.26.164')

*/

/*
SELECT * FROM NameMachine
SELECT * FROM StoreIps WHERE Name = 'MONPYFPRO'
*/

--Select * from NameMachine where [Key] = 'MONAJZPRO'



/*

10.217.24.120  
10.217.24.121  
10.217.24.123  

MONAJZPRO

10.217.24.120  

*/
/****************************************************
EJECUTAR EN BD CENTRAL USERMANAGER
.Servidor: FCXPOS05\SQL2017,50902
.Base de Datos: UserManager
.Usuario: UserManagerU
.Contraseña: --Kc4eq`Dv{6mkm>
-----------------------------------------------------
Autor: Roberto Rentería
Fecha Creación: 05-07-2022
*****************************************************/
select * from NameMachine
where [key] = 'MONLARPRO'

USE [UserManager]
GO
DECLARE
----------------------------------------------------------------------------------
/***********MODIFICA ESTA INFORMACIÓN ACORDE A TU TIENDA*************************/

@CAJAUNICA AS BIT = 1, -- ¿ES CAJA UNICA? | 0=NO, 1=SI
@WIN10 AS BIT = 1, -- ¿LAS CAJAS SON WINDOWS 10? | 0=NO, 1=SI
@NAMEPRO AS VARCHAR(20) = 'MONLARPRO', --NOMBRE CAJA PROCESOS
@IPPRO AS VARCHAR(20) = '10.200.10.238', --IP CAJA PROCESOS
@MACPRO AS VARCHAR(30) = '4C-CC-6A-99-64-65', --MAC ADDRESS DE PROCESOS
--si tu caja es unica, deja vacía la info de ventas, si no, llénala--
@IPVTA AS VARCHAR(20) = '10.200.10.237', --IP CAJA VENTAS
@MACVTA AS VARCHAR(30) = 'D8-CB-8A-F6-46-7F' --MAC ADDRESS DE VENTAS

/********************************************************************************/
----------------------------------------------------------------------------------

IF @CAJAUNICA = 0
	BEGIN
		DELETE FROM StoreIps WHERE NAME = @NAMEPRO
		DELETE FROM StoreIps WHERE StoreIp = @IPPRO
		DELETE FROM POSStoreIpMac WHERE StoreIp IN (@IPPRO,@IPVTA)
		DELETE FROM POSStoreIpMac WHERE Mac IN (@MACPRO,@MACVTA)
		DELETE FROM NameMachine WHERE [KEY] = @NAMEPRO

		INSERT INTO StoreIps VALUES (@IPPRO,@NAMEPRO,@IPPRO)
		INSERT INTO StoreIps VALUES (@IPPRO,@NAMEPRO,@IPVTA)
		INSERT INTO POSStoreIpMac VALUES (@IPPRO,@MACPRO)
		INSERT INTO POSStoreIpMac VALUES (@IPVTA,@MACVTA)

		IF @WIN10 = 0
		BEGIN
		INSERT INTO NameMachine VALUES (@NAMEPRO,2,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		END
		ELSE
		BEGIN
		INSERT INTO NameMachine VALUES (@NAMEPRO,24,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		INSERT INTO NameMachine VALUES (@NAMEPRO,3,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		END
	END
 ELSE
	BEGIN
		DELETE FROM StoreIps WHERE NAME = @NAMEPRO
		DELETE FROM StoreIps WHERE StoreIp = @IPPRO
		DELETE FROM POSStoreIpMac WHERE StoreIp IN (@IPPRO)
		DELETE FROM POSStoreIpMac WHERE Mac IN (@MACPRO)
		DELETE FROM NameMachine WHERE [KEY] = @NAMEPRO

		INSERT INTO StoreIps VALUES (@IPPRO,@NAMEPRO,@IPPRO)
		INSERT INTO POSStoreIpMac VALUES (@IPPRO,@MACPRO)

		IF @WIN10 = 0
		BEGIN
		INSERT INTO NameMachine VALUES (@NAMEPRO,2,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		END
		ELSE
		BEGIN
		INSERT INTO NameMachine VALUES (@NAMEPRO,24,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		INSERT INTO NameMachine VALUES (@NAMEPRO,3,1,GETDATE(),NULL,1,(SELECT MAX(IDNAMEMACHINE)+1 FROM NameMachine))
		END
	END
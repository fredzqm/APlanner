SELECT  DATALENGTH(HASHBYTES('MD2', 'Testing')) AS [MD2Length],
        DATALENGTH(HASHBYTES('MD4', 'Testing')) AS [MD4Length],
        DATALENGTH(HASHBYTES('MD5', 'Testing')) AS [MD5Length],
        DATALENGTH(HASHBYTES('SHA', 'Testing')) AS [SHALength],
        DATALENGTH(HASHBYTES('SHA1', 'Testing')) AS [SHA1Length],
        /* 2012 only: */
        DATALENGTH(HASHBYTES('SHA2_256', 'Testing')) AS [SHA2_256Length],
        DATALENGTH(HASHBYTES('SHA2_512', 'Testing')) AS [SHA2_512Length];
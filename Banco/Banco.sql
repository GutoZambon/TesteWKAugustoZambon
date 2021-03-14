PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM clientes;

DROP TABLE clientes;

CREATE TABLE clientes (
    SEQ_CLIENTE INTEGER       NOT NULL
                              UNIQUE
                              PRIMARY KEY AUTOINCREMENT,
    DS_CLIENTE  VARCHAR (200),
    DS_CIDADE   VARCHAR (100),
    DS_UF       VARCHAR (2) 
);

INSERT INTO clientes (
                         SEQ_CLIENTE,
                         DS_CLIENTE,
                         DS_CIDADE,
                         DS_UF
                     )
                     SELECT SEQ_CLIENTE,
                            DS_CLIENTE,
                            DS_CIDADE,
                            DS_UF
                       FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;
PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM produtos;

DROP TABLE produtos;

CREATE TABLE produtos (
    SEQ_PRODUTO INTEGER         NOT NULL
                                PRIMARY KEY AUTOINCREMENT,
    DS_PRODUTO  VARCHAR (100),
    VR_VENDA    DECIMAL (15, 2) 
);

INSERT INTO produtos (
                         SEQ_PRODUTO,
                         DS_PRODUTO,
                         VR_VENDA
                     )
                     SELECT SEQ_PRODUTO,
                            DS_PRODUTO,
                            VR_VENDA
                       FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM pedidos;

DROP TABLE pedidos;

CREATE TABLE pedidos (
    SEQ_PEDIDO INTEGER         NOT NULL
                               PRIMARY KEY AUTOINCREMENT
                               UNIQUE,
    DT_PEDIDO  DATETIME,
    ID_CLIENTE INT             REFERENCES clientes (SEQ_CLIENTE),
    VR_TOTAL   DECIMAL (16, 2) 
);

INSERT INTO pedidos (
                        SEQ_PEDIDO,
                        DT_PEDIDO,
                        ID_CLIENTE,
                        VR_TOTAL
                    )
                    SELECT SEQ_PEDIDO,
                           DT_PEDIDO,
                           ID_CLIENTE,
                           VR_TOTAL
                      FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM itens_pedido;

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM itens_pedido;

DROP TABLE itens_pedido;

CREATE TABLE itens_pedido (
    SEQ_ITEM_PEDIDO INTEGER         NOT NULL
                                    PRIMARY KEY AUTOINCREMENT
                                    UNIQUE,
    ID_PEDIDO       INT             REFERENCES pedidos (SEQ_PEDIDO) ON DELETE CASCADE,
    ID_PRODUTO      INT             REFERENCES produtos (SEQ_PRODUTO) ON DELETE CASCADE,
    QT_PRODUTO      DECIMAL (16, 2),
    VR_UNITARIO     DECIMAL (16, 2),
    vr_total        DECIMAL,
    DT_ATUALIZACAO  DATETIME
);

INSERT INTO itens_pedido (
                             SEQ_ITEM_PEDIDO,
                             ID_PEDIDO,
                             ID_PRODUTO,
                             QT_PRODUTO,
                             VR_UNITARIO,
                             DT_ATUALIZACAO
                         )
                         SELECT SEQ_ITEM_PEDIDO,
                                ID_PEDIDO,
                                ID_PRODUTO,
                                QT_PRODUTO,
                                VR_UNITARIO,
                                DT_ATUALIZACAO
                           FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

CREATE TABLE if not exists dim_tempo
( pk_tempo SERIAL PRIMARY KEY
, ano INT);

CREATE TABLE if not exists dim_local
( pk_local SERIAL PRIMARY KEY
, Município VARCHAR(50)
, UF VARCHAR(19)
, Região VARCHAR(12));

CREATE TABLE if not exists dim_parlamentar
( pk_parlamentar SERIAL PRIMARY KEY
, parlamentar VARCHAR(50));

CREATE TABLE if not exists dim_funcao
( pk_funcao SERIAL PRIMARY KEY
, nome_funcao VARCHAR(30)
, nome_subfuncao VARCHAR(50));

CREATE TABLE if not exists fato_emendas
( fk_tempo INT not NULL
, fk_parlamentar INT not NULL
, fk_local INT not NULL
, fk_funcao INT not NULL
, valor_empenhado DOUBLE PRECISION
, valor_liquidado DOUBLE PRECISION
, valor_pago DOUBLE PRECISION
, valor_restos_a_pagar_inscritos DOUBLE PRECISION
, valor_restos_a_pagar_cancelados DOUBLE PRECISION
, valor_restos_a_pagar_pagos DOUBLE PRECISION
, quantidade_emendas INT
, percentual_execucao DOUBLE PRECISION
, FOREIGN KEY(fk_tempo) REFERENCES dim_tempo(pk_tempo)
, FOREIGN KEY(fk_parlamentar) REFERENCES dim_parlamentar(pk_parlamentar)
, FOREIGN KEY(fk_local) REFERENCES dim_local(pk_local)
, FOREIGN KEY(fk_funcao) REFERENCES dim_funcao(pk_funcao)
, PRIMARY KEY(fk_tempo, fk_parlamentar, fk_local, fk_funcao));


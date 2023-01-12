CREATE DATABASE bdpitaguarynew;
\c bdpitaguarynew;



CREATE TABLE continentes (id_continente SERIAL PRIMARY KEY, 
                          continente VARCHAR(30) NOT NULL);
CREATE UNIQUE INDEX idxcontinente ON continentes(UPPER(continente));                          
                          
CREATE TABLE idiomas (id_idioma SERIAL PRIMARY KEY, 
                      idioma VARCHAR(30) NOT NULL);
CREATE UNIQUE INDEX idxidiomas ON idiomas(UPPER(idioma));
                      
CREATE TABLE formas_de_governo (id_forma_governo SERIAL PRIMARY KEY, 
                                forma_governo VARCHAR(100) NOT NULL);
CREATE UNIQUE INDEX idxformagoverno ON formas_de_governo(UPPER(forma_governo));
                                
CREATE TABLE paises (id_pais SERIAL PRIMARY KEY, 
                     pais VARCHAR(100) NOT NULL, 
                     codigo CHAR(3) NOT NULL CHECK (codigo = UPPER(codigo)), 
                     populacao INTEGER NOT NULL DEFAULT 0, 
                     area NUMERIC(10, 2) NOT NULL, 
                     id_continente INTEGER NOT NULL REFERENCES continentes(id_continente), 
                     id_forma_governo INTEGER NOT NULL REFERENCES formas_de_governo(id_forma_governo)) ;
CREATE UNIQUE INDEX idxpais ON paises(UPPER(pais));
CREATE UNIQUE INDEX idxpais_codigo ON paises(codigo);

                     
CREATE TABLE estados (id_estado SERIAL PRIMARY KEY, 
                      estado VARCHAR(100) NOT NULL, 
                      id_pais INTEGER NOT NULL REFERENCES paises(id_pais));
                      
CREATE TABLE cidades (id_cidade SERIAL PRIMARY KEY, 
                      cidade VARCHAR(100) NOT NULL, 
                      id_estado INTEGER NOT NULL REFERENCES estados(id_estado), 
                      populacao INTEGER NOT NULL DEFAULT 0);
                      
CREATE TABLE capitais (id_pais INTEGER PRIMARY KEY REFERENCES paises(id_pais), 
                      id_cidade INTEGER NOT NULL REFERENCES cidades(id_cidade));
                      
CREATE TABLE pais_idiomas (id_pais INTEGER NOT NULL REFERENCES paises(id_pais),
                           id_idioma INTEGER NOT NULL REFERENCES idiomas(id_idioma), 
                           oficial BOOLEAN NOT NULL DEFAULT 'F', 
                           percentage NUMERIC(4, 1) NOT NULL, 
                           PRIMARY KEY (id_pais, id_idioma));
                           















                     

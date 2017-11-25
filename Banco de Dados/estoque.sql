create database estoque;

use estoque;


# criar tabela : fornecedor --------------------------------


CREATE TABLE fornecedor (
  forn_codigo int(10) NOT NULL auto_increment ,
  forn_nome varchar(45),
  forn_cep int(12),
  forn_rua varchar(25),
  forn_numero int(5),
  forn_cidade varchar(45),
  forn_telefone int(15),
  primary key (forn_codigo)
  )default charset =utf8;
  

select * from fornecedor;



# criar tabela : transportadora-----------------------------


CREATE TABLE transportadora (
  transp_codigo int(10) NOT NULL auto_increment,
  transp_nome varchar(45),
  transp_cep int(12),
  transp_rua varchar(25),
  transp_numero int(5),
  transp_cidade varchar(45),
  transp_telefone int(15),
  primary key (transp_codigo)
  )default charset =utf8;


## criar tabela : itemEntrada-----------------------------------

CREATE TABLE itementrada (
  itensEnt_codigo int(10) NOT NULL auto_increment,
  itensEnt_nome varchar(45),
  itensEnt_data varchar(10),
  itensEnt_quantidade int(10),
  itensEnt_valorCusto double(10,2),
  primary key (itensEnt_codigo)
)default charset =utf8;



## criar tabela : itemSaida-------------------------------------

CREATE TABLE itemsaida (
  itensSaida_codigo int(10) NOT NULL auto_increment,
  itensSaida_nome varchar(45),
  itensSaida_data varchar(10),
  itensSaida_quantidade int(10),
  itensSaida_valorVenda double(10,2),
  primary key (itensSaida_codigo)
)default charset =utf8;



## criar tabela : setor -------------------------------------

CREATE TABLE setor(
  setor_codigo int(10) NOT NULL auto_increment,
  setor_nome varchar(45),
  setor_descricao varchar(30),
  primary key (setor_codigo)
)default charset =utf8;

##--adicionando as chaves estrangeiras da tabela : fornecedor

alter table fornecedor add column transp_codigo int;
alter table fornecedor
add foreign key (transp_codigo)
references transportadora(transp_codigo);

## adicionando as chaves estrangeiras da tabela : itementrada

alter table itementrada add column forn_codigo int;
alter table itementrada
add foreign key (forn_codigo)
references fornecedor(forn_codigo);

## adicionando as chaves estrangeiras da tabela : itemSaida

alter table itemsaida add column forn_codigo int;
alter table itemsaida
add foreign key (forn_codigo)
references fornecedor(forn_codigo);


alter table itemsaida add column setor_codigo int;
alter table itemsaida
add foreign key (setor_codigo)
references setor(setor_codigo);
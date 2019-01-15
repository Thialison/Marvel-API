# language: pt
# coding: utf-8

@listar_personagens
Funcionalidade: Listar informações dos personagens da Marvel

Como usuário dessa api
Gostaria de listar 5 personagens;

Como usuário dessa api 
Gostaria de listar informações sobre um usuário específico;

Como usuário dessa api 
Gostaria de filtrar comics de acordo com um usuário específico. 

@get @first
Cenário: Listar 5 personagens da Marvel
Dado que acesse o EndPoint characters
Quando buscar por 5 personagens
Então devo visualizar as informações dos 5 personagens

@get @second
Cenário: Listar único personagem da Marvel
Dado que acesse o EndPoint characters
Quando buscar por pelo id "1009351"
Então devo visualizar a informação do personagem

@get @third
Cenário: Listar comics de único personagem da Marvel
Dado que acesse o EndPoint characters
Quando buscar as comics de um único personagem
Então devo visualizar as comics do personagem
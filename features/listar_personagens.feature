# language: pt

@listar_personagens
Funcionalidade: Listar personagens da Marvel

Como usuário
Gostaria de listar 5 personagens;
Gostaria de listar informações sobre um personagem específico;
Gostaria de filtrar comics de acordo com um personagem específico. 

Contexto: 
  Dado que acesse o EndPoint characters

@get
Cenário: Listar 5 personagens da Marvel
  Quando buscar por 5 personagens
  Então devo visualizar as informações dos 5 personagens

@get
Cenário: Listar único personagem da Marvel
  Quando buscar por pelo id "1009351"
  Então devo visualizar a informação do personagem

@get
Cenário: Listar comics de único personagem da Marvel
  Quando buscar as comics de um único personagem
  Então devo visualizar as comics do personagem
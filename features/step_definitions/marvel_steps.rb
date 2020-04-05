Dado("que acesse o EndPoint characters") do
  @marvel = MarvelChacarters.new
end

Quando("buscar por 5 personagens") do
  @marvel.buscar_por_cinco_personagens
end

Quando("buscar as comics de um único personagem") do
  @marvel.buscar_comics
end

Quando("buscar por pelo id {string}") do |id|
  @marvel_personagem_id = @marvel.buscar_personagem(id)
end

Então("devo visualizar as informações dos 5 personagens") do
  json = @marvel.buscar_por_cinco_personagens.parsed_response
  personagens = @marvel.valida_5_personagens(json)
  status_code = @marvel.buscar_por_cinco_personagens.code
  expect(status_code).to be(200)
end

Então("devo visualizar a informação do personagem") do
  json = @marvel_personagem_id.parsed_response
  nome_estoria = @marvel.valida_nome_estoria(json)
  status_code = @marvel_personagem_id.code
  expect(status_code).to be(200)
end

Então("devo visualizar as comics do personagem") do
  json = @marvel.buscar_comics.parsed_response
  comics = @marvel.valida_comics(json)
  status_code = @marvel.buscar_comics.code
  expect(status_code).to be(200)
end




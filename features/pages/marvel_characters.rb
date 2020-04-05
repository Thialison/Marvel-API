class MarvelChacarters
  include HTTParty
  include RSpec::Matchers
  base_uri 'https://gateway.marvel.com/v1/public'
  format :json

  def generate_md5
    ts = Time.now
    ts = ts.to_s
    pri_key = "107469394574aea82766d1717306b48773ebde38"
    api_key = "bea7f07677c6d97f3c0d2aa6a8b2e50d"
    hash = Digest::MD5.hexdigest ts + pri_key + api_key
    return hash, api_key, ts
  end
  
  def buscar_por_cinco_personagens
    offset = rand(20..100)
    api = generate_md5
    self.class.get("/characters?limit=5&ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def buscar_personagem(id)
    api = generate_md5
    self.class.get("/characters/#{id}?ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def buscar_comics
    api = generate_md5
    self.class.get("/characters/1009351/comics?ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def valida_5_personagens(body)
    data = body["data"]
    contador = data["results"].count
    for i in 0..contador - 1
      puts data["results"][i]["name"]
    end
    expect(contador).to be(5) 
  end

  def valida_nome_estoria(response)
    nome_estoria = response["data"]["results"][0]["stories"]["items"][0]["name"]
    puts nome_estoria
    expect(nome_estoria).to eq("INCREDIBLE HULK (1999) #62")
  end

  def valida_comics(body)
    contador = body["data"]["results"].count
    for i in 0..contador - 1
      puts body["data"]["results"][i]["title"]
    end
    expect(contador).to be(20) 
  end
end
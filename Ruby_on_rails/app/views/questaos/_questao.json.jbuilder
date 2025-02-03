json.extract! questao, :id, :nome, :texto, :tipo, :template_id, :created_at, :updated_at
json.url questao_url(questao, format: :json)

json.extract! questionario, :id, :nome, :turma_id, :template_id, :created_at, :updated_at
json.url questionario_url(questionario, format: :json)

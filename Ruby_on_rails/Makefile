# Makefile para Projeto Ruby on Rails
# Utilize: make <target>
# Ex.: make install, make server, make test, etc.

.PHONY: all install setup migrate seed server test rubocop reek yard

# Instala as gems definidas no Gemfile
install:
	@echo "Instalando gems..."
	bundle install

# Configura o banco de dados (cria, migra e popula com dados seed)
setup: 
	@echo "Configurando o banco de dados..."
	rails db:setup

# Executa as migrações do banco de dados
migrate: 
	@echo "Executando migrações..."
	rails db:migrate

# Executa o seed do banco de dados (caso necessário)
seed: 
	@echo "Popular banco de dados..."
	rails db:seed

# Inicia o servidor Rails
server: 
	@echo "Iniciando o servidor Rails..."
	rails server

# Executa os testes automatizados (Cucumber)
test: 
	@echo "Executando testes com Cucumber..."
	bundle exec cucumber

# Executa o RuboCop para verificação de padrão de código
rubocop: 
	@echo "Verificando padrão de código com RuboCop..."
	bundle exec rubocop --auto-correct app/models app/controllers app/views features config/routes.rb

# Executa o Reek para detectar possíveis 'code smells'
reek: 
	@echo "Analisando code smells com Reek..."
	bundle exec reek app/models app/controllers app/views features config/routes.rb

# Gera a documentação com o YARD
yard: 
	@echo "Gerando documentação com YARD..."
	yard doc

rspec:
	@echo "Executando testes com RSpec..."
	bundle exec rspec spec/features

# Tarefa padrão: instala as gems e executa as migrações
all: install migrate
	@echo "Projeto preparado!"
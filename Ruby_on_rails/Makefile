# Makefile para Projeto Ruby on Rails
# Utilize: make <target>
# Ex.: make test

.PHONY: all install setup migrate seed server test rubocop reek yard

test: 
	@echo "Executando testes com Cucumber..."
	bundle exec cucumber

rubocop: 
	@echo "Verificando padrão de código com RuboCop..."
	bundle exec rubocop

rubocop_autocorrect: 
	@echo "Corrigindo código automaticamente com RuboCop..."
	bundle exec rubocop --autocorrect

rubocop-cyclomatic:
	@echo "Verificando complexidade ciclomática com RuboCop..."
	bundle exec rubocop --only CyclomaticComplexity

rubycritic:
	@echo "Analisando ABC Score com RubyCritic..."
	bundle exec rubycritic app/controllers app/models --format html --minimum-score 90 --no-browser

simpleCov:
	@echo "Gerando relatório de cobertura de testes com SimpleCov..."
	COVERAGE=true bundle exec rspec spec
	@echo "Relatório gerado em coverage/index.html"

yard: 
	@echo "Gerando documentação com YARD para controllers..."
	yard doc app/controllers/

rdoc: 
	@echo "Gerando documentação com RDoc..."
	bundle exec rdoc app/controllers/ app/models/
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

rubycritic:
	@echo "Analisando ABC Score com RubyCritic..."
	bundle exec rubycritic app/controllers app/models --format html --minimum-score 90 --no-browser

simpleCov:
	@echo "Gerando relatório de cobertura de testes com SimpleCov..."
	COVERAGE=true bundle exec rspec spec
	@echo "Relatório gerado em coverage/index.html"

yard: 
	@echo "Gerando documentação com YARD..."
	yard doc
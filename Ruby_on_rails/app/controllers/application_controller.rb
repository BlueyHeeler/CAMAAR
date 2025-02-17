# Controlador base da aplicação que fornece funcionalidades compartilhadas
# entre todos os controllers da aplicação
class ApplicationController < ActionController::Base
  # Restringe acesso apenas a navegadores modernos que suportam recursos avançados
  allow_browser versions: :modern

  # Obtém o usuário atualmente autenticado no sistema
  # 
  # @description
  #   Verifica se existe um usuário logado na sessão atual e o retorna.
  #   Utiliza memoization para evitar múltiplas consultas ao banco.
  #
  # @arguments
  #   Não recebe argumentos
  #
  # @return
  #   [User] Retorna uma instância do modelo User se houver usuário logado
  #   [nil] Retorna nil se não houver usuário logado
  #
  # @side_effects
  #   Realiza consulta ao banco de dados na primeira chamada
  #   Armazena resultado em variável de instância para consultas subsequentes
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end

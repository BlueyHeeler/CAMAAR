module CrudActions
  extend ActiveSupport::Concern

  # Cria um novo recurso no banco de dados
  # Argumentos: Nenhum (usa resource_params do controller)
  # Retorna: Nenhum
  # Efeitos colaterais: 
  #   - Cria novo registro no banco de dados
  #   - Redireciona para after_create_path em caso de sucesso
  #   - Renderiza :new com erros em caso de falha
  def create
    @resource = resource_class.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to after_create_path }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # Atualiza um recurso existente
  # Argumentos: Nenhum (usa resource_params do controller)
  # Retorna: Nenhum
  # Efeitos colaterais:
  #   - Atualiza registro no banco de dados
  #   - Redireciona para after_update_path em caso de sucesso
  #   - Renderiza :edit com erros em caso de falha
  def update
    respond_to do |format|
      if resource.update(resource_params)
        format.html { redirect_to after_update_path }
        format.json { render :show, status: :ok, location: resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # Remove um recurso existente
  # Argumentos: Nenhum
  # Retorna: Nenhum
  # Efeitos colaterais:
  #   - Remove registro do banco de dados
  #   - Redireciona para after_destroy_path
  def destroy
    resource.destroy!

    respond_to do |format|
      format.html { redirect_to after_destroy_path, status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Obtém a classe do modelo para o controller atual
  # Argumentos: Nenhum
  # Retorna: Constante da classe (ex: User, Post)
  # Efeitos colaterais: Nenhum
  def resource_class
    controller_name.classify.constantize
  end

  # Obtém a variável de instância para o recurso atual
  # Argumentos: Nenhum
  # Retorna: Instância do ActiveRecord ou nil
  # Efeitos colaterais: Nenhum
  def resource
    instance_variable_get("@#{controller_name.singularize}")
  end
  
  def resources_path
    send("#{controller_name}_path")
  end

  def after_destroy_path
    resources_path
  end

  def after_update_path
    resources_path
  end

  def after_create_path
    resources_path
  end
end
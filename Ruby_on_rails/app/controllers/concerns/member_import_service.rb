module MemberImportService
  extend ActiveSupport::Concern

  # Inicia o processo de importação de membros
  # Argumentos: 
  #   - imported_data: Hash com dados dos membros
  #   - department_name: String com nome do departamento
  # Retorna: Nenhum
  # Efeitos colaterais: Cria novo serviço e executa importação
  def import_members(imported_data, department_name)
    service = MemberImportProcessor.new(imported_data, department_name)
    service.call
  end
  
  class MemberImportProcessor
    # Inicializa o processador de importação
    # Argumentos: 
    #   - imported_data: Hash com dados dos membros
    #   - department_name: String com nome do departamento
    # Retorna: Nenhum
    # Efeitos colaterais: Nenhum
    def initialize(imported_data, department_name)
      @imported_data = imported_data
      @department_name = department_name
    end
  
    # Executa o processo de importação
    # Argumentos: Nenhum
    # Retorna: Nenhum
    # Efeitos colaterais: Cria/atualiza registros no banco
    def call
      department = find_or_create_department
      import_members
    end
  
    private
  
    # Encontra ou cria um departamento
    # Argumentos: Nenhum
    # Retorna: Instância de Departamento
    # Efeitos colaterais: Pode criar novo departamento
    def find_or_create_department
      Departamento.find_or_create_by!(nome: @department_name)
    end
  
    # Processa todos os membros para importação
    # Argumentos: Nenhum
    # Retorna: Nenhum
    # Efeitos colaterais: Chama processamento para cada membro
    def import_members
      @imported_data.each do |data|
        process_class_data(data)
      end
    end
  
    # Processa dados de uma turma específica
    # Argumentos: data: Hash com dados da turma
    # Retorna: Nenhum
    # Efeitos colaterais: Importa estudantes e professor
    def process_class_data(data)
      turma = find_turma(data)
      return unless turma
  
      import_students(data["dicente"], turma) if data["dicente"]
      import_professor(data["docente"], turma) if data["docente"]
    end
  
    # Localiza uma turma específica
    # Argumentos: data: Hash com dados da turma
    # Retorna: Instância de Turma ou nil
    # Efeitos colaterais: Nenhum
    def find_turma(data)
      materia = Materia.find_by(codigo: data["code"])
      return unless materia
  
      Turma.find_by(
        codigo: data["classCode"],
        semestre: data["semester"],
        materium_id: materia.id
      )
    end
  
    def import_students(students_data, turma)
      students_data.each do |student_data|
        next unless valid_user_data?(student_data)
        user = create_or_update_user(student_data, "student")
        create_matricula(user, turma)
      end
    end
  
    def import_professor(professor_data, turma)
      return unless valid_user_data?(professor_data)
      user = create_or_update_user(professor_data, "professor")
      create_matricula(user, turma)
    end
  
    def valid_user_data?(data)
      data["matricula"].present? && data["email"].present? && data["nome"].present?
    end
  
    def create_or_update_user(data, role)
      user = User.where(
        matricula: data["matricula"] || data["usuario"],
        email: data["email"],
        nome: data["nome"],
        role: role
      ).first_or_initialize
  
      if user.new_record?
        user.password = "password123"
        user.password_confirmation = "password123"
        user.save!
      end
      user
    end
  
    def create_matricula(user, turma)
      Matricula.find_or_create_by!(
        user_id: user.id,
        turma_id: turma.id
      )
    end
  end
end
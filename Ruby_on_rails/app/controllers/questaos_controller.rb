class QuestaosController < ApplicationController
  before_action :set_template
  before_action :set_questao, only: %i[ show edit update destroy ]

  # GET /questaos or /questaos.json
  def index
    @questaos = Questao.all
  end

  # GET /questaos/1 or /questaos/1.json
  def show
  end

  # GET /questaos/new
  def new
    @questao = @template.questaos.build
  end

  # GET /questaos/1/edit
  def edit
  end

  # POST /questaos or /questaos.json
  def create
    success = true
    created_questions = []

    if params[:questaos].present?
      params[:questaos].values.each do |questao_data|
        next if questao_data[:enunciado].blank? && questao_data[:texto].blank?

        @questao = @template.questaos.build(
          enunciado: questao_data[:enunciado],
          texto: questao_data[:texto]
        )

        if @questao.save
          created_questions << @questao
        else
          success = false
          break
        end
      end
    end

    respond_to do |format|
      if success && created_questions.any?
        format.html {
          redirect_to @template,
          notice: "#{created_questions.size} questões foram adicionadas com sucesso."
        }
        format.json { render :show, status: :created, location: @template }
      else
        created_questions.each(&:destroy)
        format.html {
          redirect_to new_template_questao_path(@template),
          alert: "Erro ao criar questões."
        }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questaos/1 or /questaos/1.json
  def update
    questao_data = params[:questaos]&.values&.first || params[:questao]

    respond_to do |format|
      if @questao.update(enunciado: questao_data[:enunciado], texto: questao_data[:texto])
        format.html {
          redirect_to template_path(@template),
          notice: "Questão foi atualizada com sucesso."
        }
        format.json { render :show, status: :ok, location: @questao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questaos/1 or /questaos/1.json
  def destroy
    @questao.destroy!

    respond_to do |format|
      format.html { redirect_to template_path(@template), status: :see_other, notice: "Questao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_questao
      @questao = Questao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questao_params
      if params[:questaos].present?
        params.require(:questaos).require("0").permit(:enunciado, :texto)
      else
        params.require(:questao).permit(:enunciado, :texto)
      end
    end
end

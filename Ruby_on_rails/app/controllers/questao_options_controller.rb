class QuestaoOptionsController < ApplicationController
  before_action :set_questao_option, only: %i[ show edit update destroy ]

  # GET /questao_options or /questao_options.json
  def index
    @questao_options = QuestaoOption.all
  end

  # GET /questao_options/1 or /questao_options/1.json
  def show
  end

  # GET /questao_options/new
  def new
    @questao_option = QuestaoOption.new
  end

  # GET /questao_options/1/edit
  def edit
  end

  # POST /questao_options or /questao_options.json
  def create
    @questao_option = QuestaoOption.new(questao_option_params)
    @questao = @questao_option.questao

    respond_to do |format|
      if @questao_option.save
        format.html { redirect_to @questao, notice: "Opção adicionada com sucesso." }
        format.json { render json: @questao_option }
        format.js
      else
        format.html { redirect_to @questao, alert: "Erro ao adicionar opção." }
        format.json { render json: @questao_option.errors }
        format.js
      end
    end
  end

  # PATCH/PUT /questao_options/1 or /questao_options/1.json
  def update
    respond_to do |format|
      if @questao_option.update(questao_option_params)
        format.html { redirect_to @questao_option, notice: "Questao option was successfully updated." }
        format.json { render :show, status: :ok, location: @questao_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questao_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questao_options/1 or /questao_options/1.json
  def destroy
    @questao_option.destroy!

    respond_to do |format|
      format.html { redirect_to questao_options_path, status: :see_other, notice: "Questao option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questao_option
      @questao_option = QuestaoOption.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def questao_option_params
      params.require(:questao_option).permit(:texto, :questao_id)
    end
end

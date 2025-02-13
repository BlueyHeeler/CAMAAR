class RespostaController < ApplicationController
  before_action :set_respostum, only: %i[ show edit update destroy ]

  # GET /resposta or /resposta.json
  def index
    @resposta = Respostum.all
  end

  # GET /resposta/1 or /resposta/1.json
  def show
  end

  # GET /resposta/new
  def new
    @respostum = Respostum.new
    @questionario = Questionario.find(params[:questionario_id])
    @questoes = @questionario.template.questaos
  end

  # GET /resposta/1/edit
  def edit
  end

  # POST /resposta or /resposta.json
  def create
    success = true

    params[:respostas].each do |resposta_params|
      @respostum = Respostum.new(resposta_params.permit(:valor, :questao_id, :questionario_id, :user_id))
      unless @respostum.save
        success = false
        break
      end
    end

    if success
      redirect_to home_homepage_path, notice: "Respostas enviadas com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resposta/1 or /resposta/1.json
  def update
    respond_to do |format|
      if @respostum.update(respostum_params)
        format.html { redirect_to @respostum, notice: "Respostum was successfully updated." }
        format.json { render :show, status: :ok, location: @respostum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @respostum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resposta/1 or /resposta/1.json
  def destroy
    @respostum.destroy!

    respond_to do |format|
      format.html { redirect_to resposta_path, status: :see_other, notice: "Respostum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respostum
      @respostum = Respostum.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def respostum_params
      params.expect(respostum: [:valor, :questao_id, :questionario_id, :user_id])
    end
end

class QuestionariosController < ApplicationController
  before_action :set_questionario, only: %i[ show edit update destroy ]

  # GET /questionarios or /questionarios.json
  def index
    @questionarios = Questionario.all
  end

  # GET /questionarios/1 or /questionarios/1.json
  def show
  end

  # GET /questionarios/new
  def new
    @questionario = Questionario.new
  end

  # GET /questionarios/1/edit
  def edit
  end

  # POST /questionarios or /questionarios.json
  def create
    @questionario = Questionario.new(questionario_params)

    respond_to do |format|
      if @questionario.save
        format.html { redirect_to @questionario, notice: "Questionario was successfully created." }
        format.json { render :show, status: :created, location: @questionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios/1 or /questionarios/1.json
  def update
    respond_to do |format|
      if @questionario.update(questionario_params)
        format.html { redirect_to @questionario, notice: "Questionario was successfully updated." }
        format.json { render :show, status: :ok, location: @questionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios/1 or /questionarios/1.json
  def destroy
    @questionario.destroy!

    respond_to do |format|
      format.html { redirect_to questionarios_path, status: :see_other, notice: "Questionario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario
      @questionario = Questionario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def questionario_params
      params.expect(questionario: [ :nome, :turma_id, :template_id ])
    end
end

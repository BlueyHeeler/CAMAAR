class RespondidosController < ApplicationController
  before_action :set_respondido, only: %i[ show edit update destroy ]

  # GET /respondidos or /respondidos.json
  def index
    @respondidos = Respondido.all
  end

  # GET /respondidos/1 or /respondidos/1.json
  def show
  end

  # GET /respondidos/new
  def new
    @respondido = Respondido.new
  end

  # GET /respondidos/1/edit
  def edit
  end

  # POST /respondidos or /respondidos.json
  def create
    @respondido = Respondido.new(respondido_params)

    respond_to do |format|
      if @respondido.save
        format.html { redirect_to @respondido, notice: "Respondido was successfully created." }
        format.json { render :show, status: :created, location: @respondido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @respondido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respondidos/1 or /respondidos/1.json
  def update
    respond_to do |format|
      if @respondido.update(respondido_params)
        format.html { redirect_to @respondido, notice: "Respondido was successfully updated." }
        format.json { render :show, status: :ok, location: @respondido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @respondido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respondidos/1 or /respondidos/1.json
  def destroy
    @respondido.destroy!

    respond_to do |format|
      format.html { redirect_to respondidos_path, status: :see_other, notice: "Respondido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respondido
      @respondido = Respondido.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def respondido_params
      params.expect(respondido: [ :questionario_id, :user_id ])
    end
end

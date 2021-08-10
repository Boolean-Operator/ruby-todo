class ListsController < ApplicationController
   before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @list = List.new
    @lists = List.all
    @titles = ["Day of Release","1 month","2 month", "3 month", "6 month"]
  end 

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_url, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def admin_page
    puts "BANG!!"
    @list = List.new
    @lists = List.all
    @titles = ["Day of Release","1 month","2 month", "3 month", "6 month"]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:item, :completed, :title)
    end
end

class DictionariesController < ApplicationController
  before_action :set_dictionary, only: [:show, :edit, :update, :destroy]

  # GET /dictionaries
  # GET /dictionaries.json
  def index
    @dictionaries = Dictionary.all.order('count DESC, created_at ASC').paginate(:page => params[:page], :per_page => 100)
  end

  # GET /dictionaries/1
  # GET /dictionaries/1.json
  def show
  end

  # GET /dictionaries/new
  def new
    @dictionary = Dictionary.new
  end

  # GET /dictionaries/1/edit
  def edit
  end

  # POST /dictionaries
  # POST /dictionaries.json
  def create
    @dictionary = Dictionary.new(dictionary_params)

    respond_to do |format|
      if @dictionary.save
        format.html { redirect_to @dictionary, notice: 'Dictionary was successfully created.' }
        format.json { render :show, status: :created, location: @dictionary }
      else
        format.html { render :new }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dictionaries/1
  # PATCH/PUT /dictionaries/1.json
  def update
    respond_to do |format|
      if @dictionary.update(dictionary_params)
        format.html { redirect_to @dictionary, notice: 'Dictionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @dictionary }
      else
        format.html { render :edit }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dictionaries/1
  # DELETE /dictionaries/1.json
  def destroy
    @dictionary.destroy
    respond_to do |format|
      format.html { redirect_to dictionaries_url, notice: 'Dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_dictionary
    @dictionary = Dictionary.find(params[:id])
  end

  def dictionary_params
    params.require(:dictionary).permit(:bigram, :count, :weight)
  end
end

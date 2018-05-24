class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all

    render json:  @entries,
                  root: true,
                  include: {
                    geocode: {only: [:lat, :long]},
                    score: {only: [:size, :adaptation_for_seniors, :medical_equipment, :medicine]}
                  },
                  methods: :entries_count
  end

  # GET /entries/1
  def show
    render json:  @entry,
                  include: {
                    geocode: {only: [:lat, :long]},
                    score: {only: [:size, :adaptation_for_seniors, :medical_equipment, :medicine]}
                  }
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:name, :address, :city, :phone, :score_id, geocode_attributes: [:lat, :long])
    end
end
# frozen_string_literal: true

class CitiesController < ApplicationController

  # GET / (root)
  def query
    @query = params[:query]
    @selected_state_id = params[:state_id]
    @cities = retrieve_cities(@query, @selected_state_id)

    respond_to do |format|
      format.json do
        render :json => {cities: @cities}
      end
      format.html do
        render 'cities/query'
      end
    end
  end

  private

  # Retrieves cities according to the parameters
  def retrieve_cities(query, federated_state_id)
    if query.nil? && federated_state_id.nil?
      City.all
    elsif !query.blank? && !federated_state_id.blank?
      City.includes(:federated_state).where('name ILIKE ? AND federated_state_id = ?', "%#{@query}%", @selected_state_id.to_s)
    else
      []
    end
  end

end

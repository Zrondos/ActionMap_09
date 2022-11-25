# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    @rep = Representative.find(params[:id])
    @address = Representative.get_address(@rep)
  end
end

include ApiHelper
class OrganisationsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      @organisations = Organisation.select(Organisation.report_field_names)
      #Switch groups to hashes ready for output
      @data = @organisations.map {|org| org.attributes}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @data = Organisation.find_by_hashid(params[:name]).select_fields
      render_api
    rescue
      api_exception
    end
  end

end

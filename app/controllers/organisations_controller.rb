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
      @org = Organisation.find(params[:id])
      @data = @org.select_fields
      #add in the list of themes
      @data[:themes] = @org.themes.map {|th| th.select_fields}
      render_api
    rescue
      api_exception
    end
  end

end

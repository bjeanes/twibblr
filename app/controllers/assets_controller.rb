class AssetsController < TwibblrController
  layout nil
  around_filter :asset_check
  
  def stylesheet
    respond_to { |format| format.css { render params[:stylesheet] if stylesheet_safe? } }
  end
  
  def javascript
    respond_to { |format| format.js  { render params[:javascript] if javascript_safe? } }
  end
  
  protected
  
    def asset_check
      yield
    rescue
      raise ActiveRecord::RecordNotFound unless development?
    end
  
    # TODO make these check the params to make sure we aren't 
    # accessing arbitrary files on the system etc
    def stylesheet_safe?
      true
    end
    def javascript_safe?
      true
    end
end
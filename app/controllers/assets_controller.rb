class AssetsController < TwibblrController
  layout nil
  around_filter :asset_check

  PUBLIC_DIR = File.join(::TWIBBLR_ROOT, 'public')
  
  def stylesheet
    respond_to { |format| format.css { send_file(File.join(PUBLIC_DIR, 'stylesheets', "#{params[:stylesheet]}.css")) } }
  end
  
  def javascript
    respond_to { |format| format.js  { send_file(File.join(PUBLIC_DIR, 'javascripts', "#{params[:javascript]}.js")) } }
  end

  def image
    respond_to do |format|
      %w{gif png jpg}.each do |f|
        format.send(f) do
          image = File.expand_path(File.join(PUBLIC_DIR, 'images', "#{params[:image]}.#{f}"))
          send_file(image) and return
        end
      end
    end
  end

  protected
  
    def asset_check
      if file_safe?
        yield
      else
        raise "unsafe file"
      end
    rescue
      raise ActiveRecord::RecordNotFound unless development?
    end
  
    # TODO make these check the params to make sure we aren't 
    # accessing arbitrary files on the system etc
    def file_safe?
      true
    end
end
module ::Twibblr
  begin
    Config = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
  rescue Errno::ENOENT => e
    abort "Please run `rake twibblr:install` to setup the necessary files for Twibblr"
  end
  
  class ReturnRenderer
    attr_accessor :to_html
    def initialize(body)
      self.to_html = "!!! #{body} !!!"
    end
  end
    
  
  def self.renderer
    @@renderer ||= load_renderer
  end
  
  def self.root
    Plugin.directory
  end
  
  protected
  
  def self.load_renderer
    case r = Config['renderer']
    when 'markdown', :markdown
      %w{Maruku RDiscount BlueCloth PEGMarkdown/peg_mardown}.each do |lib|
        begin
          require lib.downcase
          return lib.constantize
        rescue MissingSourceFile
        end
      end
    when 'textile', :textile
      require 'RedCloth'
      return RedCloth
    when nil then return ReturnRenderer
    else
      begin
        require r.to_s
        return r.camelize.constantize
      rescue MissingSourceFile # do nothing, exception raised below
      rescue NameError
        raise "Found renderer #{r} but could not determine class name (tried #{r.camelize.constantize})"
      end
    end
    
    raise "No such renderer: #{r}"
  end
end
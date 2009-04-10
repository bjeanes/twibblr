module ::Twibblr
  begin
    Config = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
  rescue Errno::ENOENT => e
    abort "Please run `rake twibblr:install` to setup the necessary files for Twibblr"
  end
  
  def self.renderer
    empty = Class.new do
      attr_accessor :to_html
      def initialize(body); self.to_html = "!!! #{body} !!!"; end
    end
    
    @@renderer ||= begin
      case Config['renderer']
      when 'markdown'
        empty
      when 'textile'
        require 'RedCloth'
        RedCloth
      when nil then empty        
      else raise "Unknown renderer"
      end          
    end
  end
  
  def self.root
    Plugin.directory
  end
end
module ::Twibblr
  begin
    Config = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
  rescue Errno::ENOENT => e
    abort "Please run `rake twibblr:install` to setup the necessary files for Twibblr"
  end
  
  def self.renderer
    @@renderer ||= begin
      case Config['renderer']
      when 'markdown'
        # TODO require different markdown libraries until one provides Markdown constant
        const_set '::Markdown', Class.new { def initialize(*args);end; def to_html; ''; end; }
      when 'textile'
        require 'RedCloth'
        RedCloth
      else raise "Unknown renderer"
      end          
    end
  end
  
  def self.root
    Plugin.directory
  end
end
require 'nokogiri'
require 'digest'

module Jekyll
  module Expand

    class ExpandTag < Liquid::Block
      include Utils

      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end

      def render(context)
        # Gather settings
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

        # Render any liquid variables
        markup = Liquid::Template.parse(@markup).render(context)
        
        plugin_dir = File.join(Jekyll.configuration({})['plugins_dir'],"jekyll-expand")
        
        # Extract tag attributes
        attributes = {}
        markup.scan(Liquid::TagAttributes) do |key, value|
          attributes[key] = value
        end
        
        @settings = site.config["jekyll-expand"]
        @button_text = attributes["button_text"]
        @preview_height = attributes["preview_height"]
        @context = context
        
        
        if @button_text.nil?
          @button_text = "Show more"
        else
          @button_text = @button_text.gsub('"','');
        end
        
        if @preview_height.nil?
          @preview_height = "120"
        else
          @preview_height = @preview_height.gsub('"','');
        end
        
        @preview_height = "--preview-height: " + @preview_height + "px;"

        
        unique_identifier = 'expandable'+Digest::MD5.hexdigest(markup)
        
        styling_html_content_text = File.read( File.join(plugin_dir,"style.html" ))
        styling_html_content_text = styling_html_content_text.gsub('--preview-height: 120px;',@preview_height);
        styling_html_content_text = styling_html_content_text.gsub('expandable',unique_identifier);
        
        script_html_content_text = File.read( File.join(plugin_dir,"script.html" ))
        script_html_content_text = script_html_content_text.gsub('Show more',@button_text);
        script_html_content_text = script_html_content_text.gsub('expandable',unique_identifier);
        
        
        data = converter.convert(super(context))
        
        # TODO: see if html already included
        expand_tag = styling_html_content_text
        expand_tag += "<section class=\"#{unique_identifier} #{unique_identifier}--collapsed\">"
        expand_tag += "<div class=\"#{unique_identifier}__row\">"
        expand_tag += "<div class=\"#{unique_identifier}__bar\"></div>"
        expand_tag += "<div class=\"#{unique_identifier}__content\" aria-hidden=\"false\">"
        expand_tag += "#{data}"
        expand_tag += "</div>"
        expand_tag += "</div>"
        expand_tag += "<button class=\"#{unique_identifier}__toggle\" type=\"button\" aria-expanded=\"false\"  aria-controls=\"bio-content\"> Show more </button>"
        expand_tag += "</section>"
        expand_tag += "#{script_html_content_text}"
      end
    end
  end
end

Liquid::Template.register_tag("expand", Jekyll::Expand::ExpandTag)

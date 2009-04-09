require 'erector'

class BaseView < Erector::Widget
  DOCTYPE = <<-TEXT 
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  TEXT

  def initialize(controller)
    @controller = controller
    super
  end

  def render
    instruct
    rawtext DOCTYPE.strip
    html do
      head_content
      body :id => @controller.name do
        div :id => 'doc4', :class  => 'yui-t7' do
          header
          menu
          main
          footer
        end
        javascript
      end
    end
  end

  def content
    p 'implement me!'
  end

  protected


  def header
    div :id => 'hd' do
      a :href => '/'
      img :src => '/images/as_logo.png'
      h1 do
        span 'Agila Sverige 2008'
      end
      h2 do
        span 'Stockholm 2-3 juni 2008'
      end
      img :id => 'date', :src => '/images/postit_note.jpg'
    end
  end

  def menu
    div :class => 'yui-g' do
      div :id => 'menu' do
        ul do
          li do
            a 'Hem', :id => "main_link", :href => '/'
            a 'Anmälan', :id => "attendant_link", :href => '/attendant/new'
            a '2008', :id => "zeroeight_link", :href => '/2008'
          end
        end
      end
    end
  end

  def head_content
    head do
      title 'Agila Sverige 2009'
      meta :content => "text/html; charset=utf-8", "http-equiv" => "content-type"
      link :rel => "stylesheet", :href => "http://yui.yahooapis.com/2.4.1/build/reset-fonts-grids/reset-fonts-grids.css", :type => "text/css"
      link :href => "/css/master", :rel => "stylesheet", :media => "screen", :type => "text/css", :charset => "utf-8"
    end
  end

  def main
    div :id => 'bd' do
      div :class => 'yui-g' do
        div :class => 'yui-u first' do
          div :id => 'maintext' do
            content
          end
        end
        div :class => 'yui-g' do
          info
          sponsors
        end
      end
    end
  end

  def footer
    div :id => 'ft' do
      p do
        rawtext '&copy; Agila Sverige 2009 | '
        a 'Kontakta oss', :href => 'mailto:info@agilasverige.se'
      end
    end
    rawtext <<-END 
      <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
      </script>
      <script type="text/javascript">
      var pageTracker = _gat._getTracker("UA-160245-3");
      pageTracker._initData();
      pageTracker._trackPageview();
      </script>
      <script type="text/javascript" src="/scripts/jquery-1.3.2.min.js"></script>
    END
  end

  def javascript
  end


  def info
    div :class => 'yui-u first' do
      div :id => 'info' do
        div :class => "register" do
          a 'Anmäl dig här!', :id => 'sign_up_link', :href => '/attendant/new'
          p(:class => "reminder") {text "Sista anmälningsdag:"}
          p(:class => "reminder") {text "25 maj 2008"}
        end

        h4 "Kommentarer på frågan 'Vad tar du med dig hem', från förra året:"
        blockquote "\"Lyckan av att umgås med så många engagerade människor\""
        blockquote "\"En massa inspiration från duktiga människor som jag har lyssnat på\""
        blockquote "\"Att det är de som är intresserade av något som kan bidra, dvs openspace-formatet\""

        h2 "Vad kostar det?"
        table(:id => "prices") do
          tr(:class => "evenrow") do
            td "Till och med 1 maj:"
            td "500 kronor"
          end
          tr(:class => "oddrow") do
            td "Efter 1 maj:"
            td "1000 kronor"
          end
          tr(:class => "evenrow") do
            td "Talare:"
            td "0 kronor"
          end
        end
        
        h2 "Vad ingår?"
        ul do
          li "Två dagars konferens"
          li "Konferensmiddag den 8 juni"
        end
        h2 "Var?"
        p do
          a(:href => "http://www.citykonferensen.se/") do
            img(:src => "/images/citykonferens.png")
          end
        end
      end

    end
  end

  def sponsors
    div :class => 'yui-u' do
      div :id => 'sponsors' do
        h2 'Sponsorer 2009'
        SponsorList.new.random_order.each do |sponsor|
          p do
            a :href => "#{sponsor.url}"
            img :src => "/images/#{sponsor.logo_file}", :alt => "#{sponsor.name}"
          end
        end
      end
    end
  end
end



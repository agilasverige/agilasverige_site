require 'rubygems'
gem 'erector'
require 'erector'

class BaseView < Erector::Widget

  needs :controller

  DOCTYPE = '''
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  '''


  def content
    instruct
    rawtext DOCTYPE.strip
    html :xmlns => "http://www.w3.org/1999/xhtml", "xml:lang" => "sv", :lang => "sv" do
      head_content
      body :id => @controller.name do
        div :id => 'doc4', :class  => 'yui-t1' do
          header
          main
          footer
        end
        local_javascript
      end
    end
  end

  protected


  def header
    div :id => 'hd', :role => 'banner' do
      div :id => 'logo_row' do
        a :href => '/' do
          img :id => 'logo_image',:src => '/images/as_logo.png', :alt => 'Agila Sverige 2010 Logo'
        end
        h1 do
          span 'Agila Sverige 2010'
        end
        h2 do
          span 'Stockholm 10-11 maj  2010'
        end
        img :id => 'date', :src => '/images/postit_note.jpg', :alt => 'Stockholm maj 2010'
      end
      div :id => 'menu' do
        ul do
          li do
            a 'Hem', :id => "main_link", :href => '/'
          end
          # li do
          #   a 'Anmälan', :id => "attendant_link", :href => '/attendant/new'
          # end
          li do
            a 'Program', :id => "program_link", :href => '/program'
          end
          li do
            a 'Tidigare konferenser', :id => "prev_conf_link", :href => '/previous_conferences'
          end
        end
      end
    end
  end


  def head_content
    head do
      title 'Agila Sverige 2010'
      meta :content => "text/html; charset=utf-8", "http-equiv" => "content-type"
      link :rel => "stylesheet", :href => "http://yui.yahooapis.com/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css", :type => "text/css"
      link :href => "/css/master", :rel => "stylesheet", :media => "screen", :type => "text/css", :charset => "utf-8"
      css
    end
  end

  def main
    div :id => 'bd', :role => 'main' do
      main_content
      subnavigation
    end
  end


  def subnavigation
    div :class => 'yui-b' do
      ul :id => 'submenu' do
        submenu_items.each do |menu_item|
          li do
            a menu_item[0], :href => menu_item[1]
          end
        end
      end
      p :id => 'follow_on_twitter' do
        a :href => "http://www.twitter.com/agilasverige" do
          img :src => "/images/twitter-follow-us-button.png", :alt => "Follow mahnve on Twitter"
        end
      end
      div :id => 'tweets' do
        script :src => "http://widgets.twimg.com/j/2/widget.js"
        javascript <<-END
          new TWTR.Widget({
            version: 2,
            type: 'search',
            search: '#agilasverige',
            interval: 20000,
            title: 'Twitter',
            subject: '',
            width: 'auto',
            height: 300,
            theme: {
              shell: {
                background: '#e20d82',
                color: '#ffffff'
              },
              tweets: {
                background: '#ffffff',
                color: '#444444',
                links: '#e20d82'
              }
            },
            features: {
              scrollbar: true,
              loop: true,
              live: true,
              hashtags: true,
              timestamp: true,
              avatars: true,
              behavior: 'default'
            }
          }).render().start();
        END
      end
    end
  end

  def main_content
    p 'implement me!'
  end

  def footer
    div :id => 'ft' do
      p do
        rawtext '&copy; Agila Sverige 2010 | '
        a 'Kontakta oss', :href => 'mailto:info@agilasverige.se'
      end
    end
    javascript <<-END 
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    END
    javascript <<-END
      var pageTracker = _gat._getTracker("UA-160245-3");
      pageTracker._initData();
      pageTracker._trackPageview();
    END
  end

  def local_javascript
    # overridden in subclass views that has javascript
  end

  def css
    # overridden in subclass views that has extra css
  end

  def info
    div :id => 'info' do
      # div :class => "register" do
      #   a 'Anmäl dig här!', :id => 'sign_up_link', :href => '/attendant/new'
      #   p(:class => "reminder") {text "Sista anmälningsdag:"}
      #   p(:class => "reminder") {text "25 april 2010"}
      # end

      h4 "Kommentarer från 2010:"
      blockquote do
        p "\"Varför kan man inte ha så här kul varje dag?\" --Sofia Cirverius, Bink"
      end
      blockquote do
        p "\"Agila Sverige 2010 - vilka dagar!\" --David Vujic, Know IT"
      end
      blockquote do
        p "\"Agilasverige är över. Fascinerande med en bransch där (åtminstonde konsulterna) strävar så intensivt och metodiskt för att förbättra sitt arbete.\" --Peter Antman, Atex"
      end
      # h2 "Vad kostar det?"
      # table(:id => "prices") do
      #   tr(:class => "oddrow") do
      #     td "Deltagare:"
      #     td "1000 kronor exkl.moms"
      #   end
      #   tr(:class => "evenrow") do
      #     td "Talare:"
      #     td "0 kronor"
      #   end
      # end
      # p 'Alla priser exklusive moms'

      # h2 "Vad ingår?"
      # ul do
      #   li "Två dagars konferens"
      #   li "Konferensmiddag"
      # end
      # h2 "Var?"
      # p do
      #   a(:href => "http://www.citykonferensen.se/") do
      #     img(:src => "/images/citykonferens.png", :alt => 'Citykonferensen logo')
      #   end
      # end

    end
  end

  def sponsors
    div :id => 'sponsors' do
      h2 'Sponsorer 2010'
      SponsorList.new.random_order.each do |sponsor|
        p do
          a :href => sponsor.url do
            img :src => "/images/#{sponsor.logo_file}", :alt => "#{sponsor.name}"
          end
        end
      end
    end
  end


  def submenu_items
    []
  end
end



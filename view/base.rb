require 'erector'

class BaseView < Erector::Widget
  DOCTYPE = <<-TEXT 
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  TEXT

  def render
    instruct
    rawtext DOCTYPE.strip
    html do
      head_content
      body :id => 'controller' do
        div :id => 'doc4', :class  => 'yui-t7' do
          header
          menu
          main
          footer
        end
      end
    end
  end

  def content
    p 'implement me!'
  end

  private

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
      img :id => 'date', :src => '/images/postit_dates.png'
    end
  end

  def menu
    div :class => 'yui-g' do
      div :id => 'menu' do
        ul do
          li do
            a 'Hem', :id => "homelink", :href => '/'
          end
        end
      end
    end
  end

  def head_content
    head do
      title 'Agila Sverige 2008'
      meta :content => "text/html; charset=utf-8", "http-equiv" => "content-type"
      link :rel => "stylesheet", :href => "http://yui.yahooapis.com/2.4.1/build/reset-fonts-grids/reset-fonts-grids.css", :type => "text/css"
      link :href => "/stylesheets/master.css", :rel => "stylesheet", :media => "screen", :type => "text/css", :charset => "utf-8"
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
        rawtext '&copy; Agila Sverige 2008 | '
        a 'Kontakta oss', :href => 'mailto:info@agilasverige.se'
      end
    end
  end

  def info
    div :class => 'yui-u first' do
      div :id => 'info' do
      end
    end
  end

  def sponsors
    div :class => 'yui-u' do
      div :id => 'sponsors' do
        h2 'Sponsorer'
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



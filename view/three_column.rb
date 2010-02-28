require 'erector'

class ThreeColumnView < BaseView

  protected

  def main_content
    div :id => 'yui-main' do
      div :class => 'yui-b' do
        div :class => 'yui-g' do
          div :class => 'yui-u first' do
            div :id => 'maintext' do
              main_text
            end
          end
          div :class => 'yui-u' do
            info
            sponsors
          end
        end
      end
    end
  end
end



require 'erector'

class ThreeColumnView < BaseView


  protected

  def main
    div :id => 'bd' do
      div :class => 'yui-g' do
        div :class => 'yui-u first' do
          div :id => 'maintext' do
            main_content
          end
        end
        div :class => 'yui-g' do
          info
          sponsors
        end
      end
    end
  end

end



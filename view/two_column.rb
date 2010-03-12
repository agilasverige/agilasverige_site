require 'erector'

class TwoColumnView < BaseView


  protected

  def main_content
    div :id => 'yui-main' do
      div :class => 'yui-b' do
        div :class => 'yui-ge' do
          div :class => 'yui-u first' do
            div :id => 'maintext' do
              main_text
            end
          end
          div :class => 'yui-u' do
            sponsors
          end
        end
      end
    end
  end

end



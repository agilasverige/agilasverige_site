require 'erector'

class TwoColumnView < BaseView


  protected

  def main
    div :id => 'bd' do
      div :class => 'yui-ge' do
        div :class => 'yui-u first' do
          div :id => 'maintext' do
            main_text
          end
        end
        sponsors
      end
    end
  end

end



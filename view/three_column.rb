class ThreeColumnView < BaseView

  protected

  def main_content
    div :id => 'yui-main' do
      div :class => 'yui-b' do
        div :class => 'yui-g' do
          div :class => 'yui-u first' do
            main_text
          end
          div :class => 'yui-g' do
            div :class => 'yui-u first' do
              info
            end
            div :class => 'yui-u' do
              sponsors
            end
          end
        end
      end
    end
  end

end



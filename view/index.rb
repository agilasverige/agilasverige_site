module MainView

  class Index < ThreeColumnView

  protected

    def main_text
      filename = File.join(File.dirname(__FILE__), 'introtext.mkd')
      text = File.read(filename)
      html = RDiscount.new(text).to_html
      rawtext html
    end


    def submenu_items
      Ramaze::Log.debug 'hej'
      [['Om konferensen', '/'],
        ['Blixttal', '/lightning_talks'],
        ['Open Space', '/open_space']]
    end
  end
end


module MainView

  class Index < ThreeColumnView

  protected

    def main_text
      filename = File.join(File.dirname(__FILE__), 'thankyou.mkd')
      text = File.read(filename)
      html = RDiscount.new(text).to_html
      rawtext html
    end


    def submenu_items
      [['Om konferensen', '/']]
    end
  end
end


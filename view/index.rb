module MainView

  class Index < ThreeColumnView


    def main_text
      filename = File.join(File.dirname(__FILE__), 'introtext.mkd')
      text = File.read(filename)
      html = RDiscount.new(text).to_html
      rawtext html
    end
  end
end


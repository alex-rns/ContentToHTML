# frozen_string_literal: true

# Class that takes content and insert it in the .html page
class ToHTML
  def insert(content)
    # TODO: add content and check for incoming HTML/JS
    html = File.new('index.html', 'w')
    html.write("<body>\n#{content}\n</body>\n")
  end
end

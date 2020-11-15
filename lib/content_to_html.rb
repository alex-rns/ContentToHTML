# frozen_string_literal: false

require 'erb'

def to_html(content, file_name = 'index', bypass_html)
  bypass_html ? content : content.gsub!(%r{<([^>]+?)([^>]*?)>(.*?)</\1>}, '')
  output_file = File.expand_path("#{file_name}.html")
  template = %(
  <html>
  <head>
    <title>Content to HTML</title>
  </head>
  <body>
    <%= @content %>
  </body>
  </html>
  )
  @content = content
  renderer = ERB.new(template)
  result = renderer.result

  File.open(output_file, 'w') do |f|
    f.write(result)
  end
end

to_html('<p>Li123fe: </p>' 'ytytyt' '<p>Li12wer3fe: </p>', 'wwww', true)

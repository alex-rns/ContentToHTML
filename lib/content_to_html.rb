# frozen_string_literal: false

require 'erb'

def to_html(content, file_name = 'index', bypass_html = false)
  bypass_html ? content : content.gsub!(%r{<([^>]+?)([^>]*?)>(.*?)</\1>}, '')
  output_file = File.expand_path("#{file_name}.html")
  template =%{<!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Content to HTML</title>
  </head>
  <body>
    <%= @content %>
  </body>
  </html>
  }
  @content = content
  renderer = ERB.new(template)
  result = renderer.result
  File.open(output_file, 'w') do |f|
    f.write(result)
  end
end

# to_html('<p>Check </p>',true)

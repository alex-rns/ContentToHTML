# frozen_string_literal: true

require 'erb'

def to_html(content, file_name = 'index')
  output_file = File.expand_path("#{file_name}.html") #=>"page.html"
  # erb_str = File.read('template.html.erb')
  erb_str = %(
  <html>
  <head>
    <title>Test</title>
  </head>
  <body>
    <%= @name %>
  </body>
  </html>
  )
  @name = content
  renderer = ERB.new(erb_str)
  result = renderer.result

  File.open(output_file, 'w') do |f|
    f.write(result)
  end
end


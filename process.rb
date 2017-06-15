require 'nokogiri'

file = STDIN.read
html = Nokogiri::HTML file

def hide element
  element['style'] = 'display: none !important;'
  element.content = ''
end

things_to_hide = [
  '.share__icon',
  '.latest-updates-panel__container',
  '.blog-post__bottom-panel',
  '.ad-panel__container--block',
  '.ad-panel__container--styled',
  '.Icon-print-edition'
]

things_to_hide.each do |thing|
  html.css(thing).each { |el| hide el }
end

html.css('.xhead').each do |el|
  el['style'] = 'font-size: 110%; font-style: italic;'
end

html.css('.blog-post__foot-note').each do |el|
  el['style'] = 'font-size: small; margin-top: 1em;'
end

html.css('.flytitle-and-title__flytitle').each do |el|
  el['style'] = 'display: block; font-size: small; font-family: Helvetica, sans-serif; font-weight: normal; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 0.5em;'
end

html.css('.flytitle-and-title__title').each do |el|
  el['style'] = 'font-size: x-large; display: block; font-weight: normal; font-style: italic;'
end

html.css('.blog-post__foot-note').each do |el|
  el['style'] = 'margin-top: 1em; font-size: small;'
end

html.css('.xhead').each do |el|
  el['style'] = 'font-size: large; font-style: italic;'
end

puts html.to_html

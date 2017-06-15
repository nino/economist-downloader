require 'selenium-webdriver'

class Category
  attr_accessor :title, :articles

  def initialize title, articles = []
    @title = title
    @articles = articles
  end
end

class Article
  attr_accessor :title, :link, :html

  def initialize title, link
    @title = title
    @link = link
  end

  def load_article! driver
    driver.get link
    begin
      post_container = driver.find_element class: 'blog-post'
      @html = post_container.attribute :innerHTML
    rescue
      @html = ''
    end
  end
end

user, password = open('login-data.txt').readlines

driver = Selenium::WebDriver.for :chrome
driver.get 'http://www.economist.com/user/login'
email_field = driver.find_element name: 'name'
email_field.send_keys user
password_field = driver.find_element name: 'pass'
password_field.send_keys password
password_field.submit

driver.get 'http://www.economist.com/printedition'

wrapper = driver.find_element class: 'print-edition__content'
date = wrapper.find_element(class: 'print-edition__main-title-header__date').text
slugline = wrapper.find_element(class: 'print-edition__main-title-header__edition').text
category_elements = wrapper.find_elements class: 'list__item'
category_objects = []
category_elements.each do |category|
  articles = category.find_elements(class: 'list__link').map do |link|
    Article.new link.text, link.attribute(:href)
  end
  category_title = category.find_element(class: 'list__title').text
  category_objects << Category.new(category_title, articles)
end

puts "<html>"
puts "<head>"
puts "<title>"
puts "The Economist · "
puts date
puts "</title>"
puts "</head>"
puts "<body>"
puts "<h1 class='book-title'>"
puts 'The Economist · '
puts date
puts "</h1>"
puts '<h2 class="slugline">'
puts slugline
puts '</h2>'


category_objects.each do |category|
  puts '<h1 class="category-header">'
  puts category.title
  puts '</h1>'
  category.articles.each do |article|
    article.load_article! driver
    puts article.html
  end
end

puts '</body>'
puts '</html>'

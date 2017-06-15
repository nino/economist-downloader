date = Time.now.strftime '%Y-%m-%d'
puts 'Getting stuff from the browser now ...'
system "ruby economist-downloader.rb > economist-#{date}.html"
puts 'Stuff has been gotten from the browser.'
puts 'Processing some stuff now ...'
system "cat economist-#{date}.html | ruby process.rb > economist-#{date}-processed.html"
puts 'Stuff has been processed.'
puts 'Turning it into an ebook now ...'
system "pandoc -s economist-#{date}-processed.html -o economist-#{date}.epub"
puts 'And we are done, theoretically.'

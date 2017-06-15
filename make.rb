date = Time.now.strftime '%Y-%m-%d'
system 'mkdir -p tmp'
system 'mkdir -p issues'
puts 'Getting stuff from the browser now ...'
system "ruby economist-downloader.rb > tmp/economist-#{date}.html"
puts 'Stuff has been gotten from the browser.'
puts 'Processing some stuff now ...'
system "cat tmp/economist-#{date}.html | ruby process.rb > tmp/economist-#{date}-processed.html"
puts 'Stuff has been processed.'
puts 'Turning it into an ebook now ...'
system "pandoc -s tmp/economist-#{date}-processed.html -o issues/economist-#{date}.epub"
puts 'And we are done, theoretically.'

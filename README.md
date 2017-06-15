# Economist print edition downloader

The Economist mobile app is atrocious
and reading on the website is not pleasant,
so here is a script that downloads the print edition of the Economist
and turns it into an epub file.

The script is only meant for personal use
and you need to have an active subscription to the Economist
to run it.

## Dependencies

You will need

- The `selenium-webdriver` ruby gem (`gem install selenium-webdriver`)
- `chromedriver`
  (`brew install chromedriver` or whatever one does on Linux and Windows)
- Pandoc (`brew install pandoc`)

## How to make it go

First, create a file called `login-data.txt`
and put your username on the first line
and your password on the second line
and nothing else in the file.
(See `login-data.sample.txt`.)

Then, run `ruby make.rb` and sit back and wait.


#!/usr/bin/env ruby

def match_school(text)
  regex = /School/
  matches = text.scan(regex)

  if matches.any?
    puts matches.join
  end
end

if ARGV.length == 1
  text_to_search = ARGV[0]
  match_school(text_to_search)
end

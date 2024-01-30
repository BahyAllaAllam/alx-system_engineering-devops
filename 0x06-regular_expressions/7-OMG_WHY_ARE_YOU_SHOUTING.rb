#!/usr/bin/env ruby

def match_pattern(text)
  regex = /[A-Z]/
  matches = text.scan(regex)

  if matches.any?
    puts matches.join
  end
end

if ARGV.length == 1
  text_to_search = ARGV[0]
  match_pattern(text_to_search)
end

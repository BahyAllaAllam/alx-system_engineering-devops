#!/usr/bin/env ruby

def match_pattern(text)
  regex = /hb(t{1,4})n/
  match = text.match(regex)

  if match
    puts match.to_s
  end
end

if ARGV.length == 1
  text_to_search = ARGV[0]
  match_pattern(text_to_search)
end

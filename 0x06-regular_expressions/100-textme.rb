#!/usr/bin/env ruby
puts ARGV[0].scan(/\[from:(\w+)]\s\[to:(\W+\d+)]\s\[flags:(\W\d.{10})]\s/).join(separator=', ')

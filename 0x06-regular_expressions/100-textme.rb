#!/usr/bin/env ruby
puts ARGV[0].scan(/\[from:(.\w*)\]\s\[to:(\W*\d*)\]\s\[flags:((?:-?\d:?)+)/).join(separator=', ')

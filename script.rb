require 'time'
require 'json'
query = ARGV[0]
d = query.split(/,\s*/).inject(0) { |acc, ts|
  t1, t2 = ts.split /\s*-\s*/
  t1 = Time.parse(t1)
  t2 = Time.parse(t2)
  d = (t2 - t1) / 60 / 60 # in hours
  acc += d
  acc
}
h = d.floor.to_i
m = (d % 1 * 60).to_i
data = {
  items: [
    {
      title: "Total duration: #{d} (#{h} hours #{m} minutes)",
      arg: "#{d} (#{h} hours #{m} minutes)"
    }
  ]
}
puts data.to_json

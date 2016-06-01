require "safe_yaml"

gems=`gem list -r`

gg=gems.split("\n")

gg=gg.map {|x| x.split(" ")[0]}

gg.each do |x|
  puts x
  `gem specification #{x} -r > #{x}.spec`
  #out=YAML.load(out, :safe => true)
  #puts out["name"]
end
##puts out
#
#
#puts out["name"]



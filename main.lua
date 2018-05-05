local first = {}
local rows
for line in io.lines("example.rsv") do
  local sep = line:find(",")
  if sep then
    if rows then
      rows[#rows+1] = line:sub(1, sep-1)
    else
      first[#first+1] = line:sub(1, sep-1)
      rows = {}
    end
    rows[#rows+1] = line:sub(sep+1)
  elseif rows then
    rows[#rows+1] = line
  else
    first[#first+1] = line
  end
end

for r=0, #rows-1, #first do
  for i=1, #first do
    print(first[i]..": "..rows[r+i])
  end
end

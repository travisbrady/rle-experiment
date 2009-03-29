local lastline = nil
local its = 0
local this_start = 0
local this_len = 1
for line in io.lines() do
    if its == 0 then
        lastline = line
      elseif line ~= lastline then
        local ll = string.gsub(lastline, "\n", "")
        print(string.format("%s,%d,%d", ll, this_start, this_len))
        this_start = its
        this_len = 1
      else
        this_len = this_len + 1
    end
    lastline = line
    its = its + 1
end

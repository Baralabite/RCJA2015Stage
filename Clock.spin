VAR

  long count
  long stack[20]
  byte cogid_

PUB Start

  cogid_ := cognew(Loop, @stack)

PRI Loop

  repeat
    count++
    waitcnt(clkfreq/1000+cnt)

PUB getCount

  return count

PUB reset

  count := 0

PUB stop

  cogstop(cogid_)

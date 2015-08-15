VAR

  long count
  long stack[20]

PUB Start

  cognew(Loop, @stack)

PRI Loop

  repeat
    count++
    waitcnt(clkfreq/1000+cnt)

PUB getCount

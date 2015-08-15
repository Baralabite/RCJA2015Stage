gCON

  _clkmode = xtal1 + pll8x
  _xinfreq = 10_000_000

OBJ

  Stage: "Stage"
  Serial: "FullDuplexSerial"
  Clock: "Clock"

PUB Main

  Stage.start
  routine

PUB routine | curtainStatus

  curtainStatus := 0

  repeat until Stage.buttonPressed
  repeat while Stage.buttonPressed
  Clock.start
  repeat
    if Clock.getCount == 1943
      Stage.setLightValue(80)
    if Clock.getCount == 7898
      Stage.setLightValue(20)

    if Clock.getCount == 2051
      Stage.openCurtains
      curtainStatus := 1

    if Clock.getCount == 8638
      Stage.setLightValue(80)
    if Clock.getCount == 14811
      Stage.setLightValue(20)

    if Clock.getCount == 15882
      Stage.setLightValue(80)
    if Clock.getCount == 17688
      Stage.setLightValue(20)

    if Clock.getCount == 18206
      Stage.setLightValue(80)
    if Clock.getCount == 18781
      Stage.setLightValue(20)

    if Clock.getCount == 19301
      Stage.setLightValue(80)
    if Clock.getCount == 19770
      Stage.setLightValue(20)

    if Clock.getCount == 20299
      Stage.setLightValue(80)

    if Clock.getCount == 22736
      stage.setLightValue(20)
      Stage.closeCurtains
      curtainStatus := 2


    if curtainStatus == 1
      if Stage.curtainsOpen == 0
        Stage.moveOpen
      else
        Stage.stopCurtains


PUB dumpValues

  Serial.start(31, 30, 0, 9600)
  Serial.str(String("Timing Values:", 13))
  repeat until Stage.buttonPressed
  repeat while Stage.buttonPressed
  Serial.str(String("Time started...", 13))
  Clock.start
  repeat
    if Stage.buttonPressed
      Serial.str(String("Button Down: "))
      Serial.dec(Clock.getCount)
      Serial.tx(13)
      Stage.setLightValue(90)
      repeat while Stage.buttonPressed
      Stage.setLightValue(10)
      Serial.str(String("Button Up: "))
      Serial.dec(Clock.getCount)
      Serial.tx(13)
      waitcnt(clkfreq/5+cnt)

PUB buttonDemo

  Serial.start(31, 30, 0, 9600)
  DIRA[16]~
  repeat
    Serial.bin(stage.buttonPressed, 1)
    if stage.buttonpressed
      stage.buzz
    waitcnt(clkfreq/10+cnt)


PUB lightCycleDemo
  repeat
    Stage.openCurtains
    waitMS(2000)
    Stage.setLightValue(80)
    waitMS(2000)
    Stage.setLightValue(20)
    waitMS(2000)
    Stage.closeCurtains
    waitMS(2000)

PRI waitS(s)

  repeat s
    waitcnt(clkfreq+cnt)

PRI waitMS(ms)

  waitcnt((clkfreq/1000)*ms+cnt)


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
  stage.buzz
  repeat
    if Clock.getCount == 11159
      Stage.setLightValue(80)
    if Clock.getCount == 17097
      Stage.setLightValue(20)

    if Clock.getCount == 11159
      Stage.openCurtains
      curtainStatus := 1

    if Clock.getCount == 17848
      Stage.setLightValue(80)
    if Clock.getCount == 24346
      Stage.setLightValue(20)

    if Clock.getCount == 25214
      Stage.setLightValue(80)
    if Clock.getCount == 27069
      Stage.setLightValue(20)

    if Clock.getCount == 27443
      Stage.setLightValue(80)
    if Clock.getCount == 27990
      Stage.setLightValue(20)

    if Clock.getCount == 28492
      Stage.setLightValue(80)
    if Clock.getCount == 29104
      Stage.setLightValue(20)

    if Clock.getCount == 29648
      Stage.setLightValue(80)

    if Clock.getCount == 32571
      stage.setLightValue(20)

    if Clock.getCount == 47310
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


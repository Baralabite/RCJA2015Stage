{
Stage.spin
Driver for stage
Author: John Board
}

  CURTAIN_ENA = 3
  CURTAIN_DIR = 4
  CURTAIN_CUR = 5

  LIGHT_PWM = 6
  LIGHT_ENA = 7

  SWITCH_PIN = 16
  BUZZER_PIN = 17

OBJ

  PWM: "PWM"

PUB Start

  initCurtains
  initLight
  initMisc

PUB initCurtains

  DIRA[CURTAIN_ENA..CURTAIN_DIR]~~
  DIRA[CURTAIN_CUR]~
  repeat until INA[CURTAIN_CUR] == 0                      'Waits for current overload indicator to set

PUB initLight

  PWM.start
  DIRA[LIGHT_PWM..LIGHT_ENA]~~
  turnLightOn
  setLightValue(10)

PUB initMisc

  DIRA[BUZZER_PIN]~~
  DIRA[SWITCH_PIN]~

PUB openCurtains

  moveOpen
  repeat until INA[CURTAIN_CUR] == 1
  stopCurtains

PUB moveOpen

  OUTA[CURTAIN_ENA..CURTAIN_DIR] := %11

PUB curtainsOpen

  return INA[CURTAIN_CUR]

PUB stopCurtains

  OUTA[CURTAIN_ENA..CURTAIN_DIR] := %00

PUB closeCurtains

  OUTA[CURTAIN_ENA..CURTAIN_DIR] := %10
  waitcnt((clkfreq/1000)*5500+cnt)
  stopCurtains

PUB buzz

  OUTA[BUZZER_PIN]~~
  waitcnt(clkfreq/10+cnt)
  OUTA[BUZZER_PIN]~

PUB buttonPressed

  return INA[SWITCH_PIN]

PUB turnLightOff

  OUTA[LIGHT_ENA]~

PUB turnLightOn

  OUTA[LIGHT_ENA]~~

PUB setLightValue(val)
  {Please note min value is 10-11, max value is 89-90}

  PWM.duty(LIGHT_PWM, val, 200)


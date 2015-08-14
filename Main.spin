CON

  _clkmode = xtal1 + pll8x
  _xinfreq = 10_000_000

  ESCON_ENA = 3
  ESCON_DIR = 4
  ESCON_CUR = 5

  LIGHT_PWM = 6
  LIGHT_ENA = 7

  SWITCH_PIN = 16
  BUZZER_PIN = 17

OBJ

  Serial: "FullDuplexSerial"
  PWM: "PWM"

PUB Main | dir

  PWM.start
  Serial.start(31, 30, 0, 9600)
  Serial.str(String("Starting...", 13))
  DIRA[ESCON_ENA..ESCON_DIR]~~
  DIRA[ESCON_CUR]~
  DIRA[LIGHT_PWM..LIGHT_ENA]~~
  DIRA[SWITCH_PIN]~
  DIRA[BUZZER_PIN]~~

  OUTA[LIGHT_ENA]~~
  PWM.duty(LIGHT_PWM, 90, 200)

  {repeat
    Serial.tx(13)
    Serial.bin(INA[SWITCH_PIN], 1)
    if INA[SWITCH_PIN] == 1
      OUTA[BUZZER_PIN]~~
    else
      OUTA[BUZZER_PIN]~
    waitcnt(clkfreq/10+cnt)}

  repeat until INA[ESCON_CUR] == 0

  repeat until INA[ESCON_CUR] == 1
    open

  close
  waitcnt((clkfreq/1000)*6000+cnt)

  stop

  repeat

PUB open

  OUTA[ESCON_ENA..ESCON_DIR] := %11

PUB close

  OUTA[ESCON_ENA..ESCON_DIR] := %10

PUB stop

  OUTA[ESCON_ENA..ESCON_DIR] := %00


CON

  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

  ESCON_LEFT_SPEED              = 3
  ESCON_LEFT_CW                 = 4
  ESCON_LEFT_CCW                = 5

  ESCON_SPEED = 3
  ESCON_CW = 4
  ESCON_CCW = 5

OBJ

  PWM: "Servo"

PUB Main

  PWM.start

  repeat
  
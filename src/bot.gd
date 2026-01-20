class_name Bot extends Tank
## src/bot.gd
## Beep boop driven tank logic, with a variety of "personalities". Each
## personality has its own rules governing its playstyle, which is further
## modified by a difficulty level.
##
## For example, the "sharpshooter" personality prefers to aim directly at tanks
## whenever possible, and at easy is "usually" accurate; at hard, the bot
## always "snipes" its enemies.

# ai logic:
#   on each turn, rank players according to danger level
#      1)  direct shot   2) easy indirect   3) tricky indirect   4) no access
#      direct => can aim directly and hit with power 100%
#      indirect requires a lobbing
#   select most dangerous target; in event of tie, random
#   select best weapon to hit them with
#   fire ze missiles!
#
# adjusting for difficulty:
#   regular
#     some threshold on knowledge, influencing decisions. 25-50% error?
#   hard
#     some threshold on knowledge, influencing decisions. 10-25% error?
#   impossible
#     always knows exact health/trajectories

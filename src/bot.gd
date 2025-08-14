## src/bot.gd
class_name Bot extends Node # controls Tank

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

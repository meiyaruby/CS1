module Traffic

data light = green | amber | red

change: light -> light
change green = amber
change amber = red
change red = green

# Review of a03

# RACE CONDITIONS
# When working with multiple clients and high degree of concurrency, the race condition gets incidious
# Tell don't ask.
# Don't ask for value, compute, and update. Tell the worker with the value to compute
# If you are getting a value and then changing it, stop and think

# PMAP
# Philosphy of Wrapper vs Anonymous
# It is good to hide implementation
# Levels of Abstraction -> Want to keep every code in a chunk that is of about same level of abstraction
# Narrative -> Easy to read and understand.

# Framework vs Library
# Library -> code you can call
# Framework -> code the calls you

# MVC
# Controller -> does no work except for invoking
# Logic should be in Model. If the Controller has logic, you can only access it from browser

# Web Architecture
# Stateless -> req and res are in theory independent of each other



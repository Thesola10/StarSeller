#!/bin/sh
# The Star Seller exercise in algorithmics,
# written in Bourne Shell script.           [21 lines of code]

# Some say that Bourne shell is not a good choice for more complex programs,
# and I agree. The quirk is that it's a shell, and not a regular runtime.
# As such, it is expensive in that it will keep spawning new processes at
# pretty much every line.
# 
# Regardless, shell script is lightweight, fast to test and universal.
# 
# This implementation only requires echo with the -n and -e options,
# and read. (They should be consistent in bash)

valid=0

while !((valid))
do
    echo -n "What is your name? "
    read name
    ((${#name})) && valid=1
done

valid=0

echo "Hello, $name!"
while !((valid))
do
    echo -n "How many stars do you want? "
    read stars
    ((stars >= 0)) && ((stars <= 200)) && valid=1
done

while ((stars))
do
    ((stars--))
    echo -n "*"
done

echo -e "\nGoodbye, $name"

# This language is case-sensitive.

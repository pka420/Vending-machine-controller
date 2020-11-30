# Vending-machine-controller
Vending machine controller FSM
Supports several modes:
                       Free (dispense items for free)
                       Display (displays the price)
                       Program (Allows to write price (up to $2.55) to RAM for each product)
                       Vending (Requires correct amount of coins to be input in order to dispense the product)
                       
                       Reset (soft reset, also doubles up as idle mode)
                       HardReset (Clears the ram and resets the state)
Also has functionality to output to seven segment displays, though since the program was simulated using quartus pro, the program simply displays the price in binary.
made with a group of two -- Glenator (Gleb or @coolcake) from my class.

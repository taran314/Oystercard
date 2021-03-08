In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated



| Object        | Message                     | Methods                  |
| ------------- | --------------------------- | ------------------------ |
| Card          | Add money (up to limit)     | add_money(money)         |
|               | How much on card?           | balance                  |  
|               | Touch in                    | touch_in(station)        |
|               | Touch out                   | touch_out(station)       |
|               | Deduct fare on touch out    | journey_fare(fare)       |
|               | Penalty if no touch out     | penalty                  |
| Zones         | Stations                    | Hash                     |

card = Card.new
card.add_money(20)
card.touch_in(hammersmith)
card.touch_out(cockfosters)
card.balance
station["station name"] returns zone

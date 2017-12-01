# connect-four

## Planning

* ConnectFour

* Board
  * 2D array
    * `0`: empty space
    * `1`: player 1
    * `-1`: player 2
  * `win_check`
    * Sum 4 space window along straight lines
      * `= 4`: player 1
      * `= -4`: player 2
  * `drop_piece(column, player)`
    * place piece at the lowest open space in the column

## Board

```ruby
[[ 1,  0,  0,  0,  0,  0],
 [-1,  0,  0,  0,  0,  0],
 [-1,  1,  0,  0,  0,  0],
 [ 1, -1,  0,  0,  0,  0],  <--drop
 [ 1,  0,  0,  0,  0,  0],
 [ 0,  0,  0,  0,  0,  0],
 [ 0,  0,  0,  0,  0,  0]]
```

This board configuration allows easy iteration through columns to place pieces.
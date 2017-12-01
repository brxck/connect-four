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
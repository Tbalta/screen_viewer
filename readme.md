Processing script used as screen emulator for the dummy_screen.
# Requirements
This script use processing 4.

# Protocol
## init
Initialise the screen with specified width, and height.
```json
{
    "type": "init", 
    "width": 200,
    "height": 200
}
```
## clear
clear the screen
```json
{
    "type": "clear"
}
```
## draw a line
draw a line from (x0, y0) to (x1, y1)
```json
{
    "type": "draw_line",
    "x0": 0,
    "y0": 0,
    "x1": 0,
    "y1": 0
}
```

## draw a rectangle
draw a rectangle from (x, y) with width and height
```json
{
    "type": "fillRect",
    "x": 0,
    "y": 0,
    "w": 0,
    "h": 0
}
```
## set the color
set the color of the stroke color in rgb.
```json
{
    "type": "set_color",
    "r" : 0,
    "g" : 0,
    "b" : 0
}

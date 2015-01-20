# richest
A simple text editor for learning purposes

## Papers to read

https://www.cs.unm.edu/~crowley/papers/sds.pdf

## Data structures

Most writing on this online either refers to a "rope" structure or a "piece chain" structure. I'm not yet sure whether these are different things or not.

### Ropes

http://en.wikipedia.org/wiki/Rope_(data_structure)

### Piece tables

Piece tables are used by AbiWord. http://e98cuenc.free.fr/wordprocessor/piecetable.html

Piece tables are also used by NeatPad. http://www.catch22.net/tuts/piece-chains

Piece tables can either be backed with a binary tree (AbiWord example describes red-black tree) or a linked list.

## Viewports

Some quick notes on viewports:

Viewports have:

- dimensions on the actual screen
- a position on the virtual document
- a scale factor on the virtual document
- a position on the buffer that this corresponds to (may not be 0, 0 to allow smoother scrolling)
- whether the buffer needs redrawing or not

a useful set of things to be able to get, from the point of view of code trying to draw something:

- is the buffer dirty?
- what's the bounds of the area in the virtual document?
- what's the matrix transform I need to use when drawing to shift coordinates from the virtual space to the buffer?

## GL text rendering

http://delphic.me.uk/webgltext.html gives example code for rendering text in WebGL

https://developer.mozilla.org/en-US/docs/Web/WebGL/Using_textures_in_WebGL explains how to use a DOM element's 2d data as texture in webgl

http://www.html5rocks.com/en/tutorials/webgl/webgl_fundamentals/ - slightly more useful tutorial on loading textures, doing 2d webgl, etc

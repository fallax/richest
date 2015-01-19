# Viewports

A very simple bit of code to implement a viewport.

	window.viewport = () ->	
		a =
			scaleX: 2,
			scaleY: 2,
			bufferX: 0,
			bufferY: 0,
			bufferSizeX: 1000,
			bufferSizeY: 1000,
			camX: 0,
			camY: 0,
			sizeX: 500,
			sizeY: 500,
			buffer: null, 
			bufferdirty: true,
			dirty: true
		a

We need a way of working out what position on the virtual canvas corresponds to a position on the screen.

	window.getPos = (viewport, x, y) ->
		[ 
			viewport.camX + (x / viewport.scaleX), 
			viewport.camY + (y / viewport.scaleY)
		]

We need a way of working out what position on the virtual canvas corresponds to a position on the buffer.

	window.getBufferPos = (viewport, x, y) ->
		[ 
			viewport.bufferX + (x / viewport.scaleX), 
			viewport.bufferY + (y / viewport.scaleY)
		]

We need a way of working out the bounds of the buffer on the virtual canvas.

	window.getBufferBounds = (viewport) ->
		topLeft = getBufferPos(viewport, 0, 0)
		bottomRight = getBufferPos(viewport, viewport.bufferSizeX, viewport.bufferSizeY)
		[
			topLeft[0],
			topLeft[1], 
			bottomRight[0], 
			bottomRight[1]
		]

And a way of working out the bounds of the region visible through the viewport on the virtual canvas.

	window.getCameraBounds = (viewport) ->
		topLeft = getPos(viewport, 0, 0)
		bottomRight = getPos(viewport, viewport.sizeX, viewport.sizeY)
		[
			topLeft[0],
			topLeft[1], 
			bottomRight[0], 
			bottomRight[1]
		]

We need to be able to work out if part of the visible region is outside what we've got buffered.

	window.outsideBuffer = (view) ->
		bufferBounds = getBufferBounds view
		cameraBounds = getCameraBounds view

		cameraBounds[0] < bufferBounds[0] or 
			cameraBounds[2] > bufferBounds[2] or 
			cameraBounds[1] < bufferBounds[1] or 
			cameraBounds[3] > bufferBounds[3]

	window.transformContext = (viewport, context) ->
		context.setTransform 1, 0, 0, 1, 0, 0
		context.scale viewport.scaleX, viewport.scaleY 
		context.translate -viewport.bufferX, -viewport.bufferY


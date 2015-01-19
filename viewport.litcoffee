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

We need a way of working out the bounds of the buffer on the virtual canvas.

	window.getBufferBounds = (viewport) ->
		[
			viewport.bufferX, 
			viewport.bufferY, 
			viewport.bufferX + (viewport.bufferSizeX / viewport.scaleX), 
			viewport.bufferY + (viewport.bufferSizeY / viewport.scaleY)
		]

And a way of working out the bounds of the region visible through the viewport on the virtual canvas.

	window.getCameraBounds = (viewport) ->
		[
			viewport.camX, 
			viewport.camY, 
			viewport.camX + (viewport.sizeX / viewport.scaleX), 
			viewport.camY + (viewport.sizeY / viewport.scaleY)
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


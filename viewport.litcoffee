# Viewports

A very simple bit of code to implement a viewport.

	window.viewport = () ->	
		a =
			scaleX: 1,
			scaleY: 1,
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

	window.transformContext = (viewport, context) ->
		context.setTransform 1, 0, 0, 1, 0, 0
		context.scale viewport.scaleX, viewport.scaleY 
		context.translate -viewport.bufferX, -viewport.bufferY

	window.getBounds = (viewport) ->
		[
			viewport.bufferX, 
			viewport.bufferY, 
			viewport.bufferX + (viewport.bufferSizeX / viewport.scaleX), 
			viewport.bufferY + (viewport.bufferSizeY / viewport.scaleY)
		]

	window.getPos = (viewport, x, y) ->
		[ 
			viewport.camX + (x / viewport.scaleX), 
			viewport.camY + (y / viewport.scaleY)
		]
# Viewports

A very simple bit of code to implement a viewport.

	window.viewport = () ->	
		a =
			scaleX: 1,
			scaleY: 1,
			camX: 0,
			camY: 0,
			sizeX: 500,
			sizeY: 500
		a

	window.transformContext = (viewport, context) ->
		context.setTransform 1, 0, 0, 1, 0, 0
		context.scale viewport.scaleX, viewport.scaleY 
		context.translate -viewport.camX, -viewport.camY


	window.getBounds = (viewport) ->
		[
			viewport.camX, 
			viewport.camY, 
			viewport.camX + (viewport.sizeX / viewport.scaleX), 
			viewport.camY + (viewport.sizeY / viewport.scaleY)
		]

	window.getPos = (viewport, x, y) ->
		[ 
			viewport.camX + (x / viewport.scaleX), 
			viewport.camY + (y / viewport.scaleY)
		]
window.canvasContext = null
canvas = null

window.makeCanvas = () ->
	$('BODY').append $("<canvas id='canvas'></canvas>")
	canvas = document.getElementById 'canvas'
	window.canvasContext = canvas.getContext '2d'
	height = canvas.height = 500 #document.body.offsetHeight
	width = canvas.width = document.body.offsetWidth
	
window.blankCanvas = (target) ->
	# From http://stackoverflow.com/a/6722031
	if not target? then target = window.canvasContext

	# Store the current transformation matrix
	target.save()

	# Use the identity matrix while clearing the canvas
	target.setTransform(1, 0, 0, 1, 0, 0)
	target.clearRect(0, 0, 1000, 1000)

	# Restore the transform
	target.restore()

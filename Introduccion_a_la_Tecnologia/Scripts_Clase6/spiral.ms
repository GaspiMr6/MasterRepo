
-- Comentario
/* Comentario multilinea*/

function Spiral NumSamples NumTurns MaxRadius = (
	format "Spiral de % samples, % turns and % radius\n" NumSamples NumTurns MaxRadius
	
	for i=1 to NumSamples do (
		-- U es un numero que va entre 0 y 1 en cada iteracion 
		local u = i / (float) NumSamples
		local obj_angle = NumTurns * 360 * u
		local obj_rad = MaxRadius * u
		local obj_color = red * u + blue * (1-u) 
		format " Creando Sample % % % %\n" i u obj_angle obj_color 		
		local rotationMatrix = rotateZMatrix obj_angle
		local newPos = [obj_rad,0,0]
		local rotatePos = newPos * rotationMatrix
		local newObj = Sphere()
		newObj.pos = rotatePos
		newObj.wireColor = obj_color
	)
	
	return 0
)

delete $Sphere*
Spiral 200 3 2000
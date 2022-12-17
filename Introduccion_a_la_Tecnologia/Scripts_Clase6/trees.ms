clearListener()

fn createTrees TheCurve NumTrees = (
	
	-- Find Limits
	
	x = TheCurve.boundingbox
	-- x.min / x.max
	
	i = 0
	while (i<NumTrees) do (
		
		newPos = random x.min x.max
		dist = measureOffset TheCurve newPos
		dist = abs(dist)
		print dist
		
		if dist > 100 then (
			
			minDist = 99999
			trees = $Spher*
			for i=1 to trees.count do (
				distToTrees = distance trees[i].pos newPos
				if (distToTrees < minDist) then(
					minDist = distToTrees
				)
			)
			if (minDist<100000) then (
				local newTree = Sphere()
				newTree.pos = newPos
			) 
			i = i + 1
		)
		
		
		
	)
	

	-- Generate NumTrees Trees
	-- random x.min x.max
	-- Find a position
	
	-- Validate positionController
	-- measureOffset <spline> <point3>
	-- Ojo da un numero negativo si estas por fuera
	
	-- local tree = Sphere()
	
)

delete $Sphere*
CreateTrees $Line001 100
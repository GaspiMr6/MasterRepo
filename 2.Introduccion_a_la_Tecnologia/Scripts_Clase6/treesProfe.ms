clearListener()

struct TObstacle (
	position,	-- The center of the obstacle
	radius,     -- How big is this obstacle
	maxObj,	    -- The max object
	
	fn sayHi = (
		format "Soy el obstacle de radius %\n" radius
	)
	
)

struct TTreeGeneratorTool (

	theCurve,
	obstacles = #(),
	num_trees = 500,
	distance_to_road = 15,
	
	fn isTooClose newObstacle = (
		
		-- Iterate over all trees in the trees array
		--for tree in trees do (
		--	 local distCenters = distance tree.pos candidatePos
		--	 if distCenters < radius*2 then (
		--	 	return true 
		--	 )
		--)

		-- Iterate over all trees in the trees array
		for obstacle in obstacles do (
			 local distCenters = distance obstacle.position newObstacle.position
			 if distCenters < obstacle.radius + newObstacle.radius then return true 
		)
		return false
	),

	fn createTrees = (
		
		-- Find limits
		local limits = theCurve.boundingbox
		limits = scale limits 1.5
		local pmin = limits.min
		local pmax = limits.max
		
		local obstacles = #()
		
		-- Generate numtrees trees
		for i=1 to num_trees do (
			
			local newObstacle = TObstacle()
			newObstacle.radius = random 20 50
			
			-- Find a position
			newObstacle.position = random pmin pmax
			
			-- Validate position is not too close to the road
			local distanceToCurve = measureOffset theCurve newObstacle.position
			if abs distanceToCurve < 100 then continue
				
			-- Validate position is not too close to other trees
			if isTooClose newObstacle then continue
			
			local tree = Sphere()
			tree.position = newObstacle.position
			tree.radius = newObstacle.radius
			newObstacle.maxObj = tree
			
			-- Register the new tree, so future trees don't grow to close to this one
			append obstacles newObstacle
			
		)
	)
)

rollout ro_TreeGenerator "The Tree Generator" width:162 height:113
(
	fn onlyShapes obj = (
		return classof obj == line
	)	
	
	button 'btn1' "Generate tres" pos:[62,7] width:39 height:21 toolTip:"Super button" align:#left
	pickbutton 'btn2' "Choose Curve" pos:[37,36] width:95 height:30 enabled:true message:"Choose the Curve To Generate the trees" filter:onlyShapes align:#left
	local theTool = TTreGeneratorTool()
	
	spinner 'spn_distance_to_road' "Distance to Road" pos:[22,75] width:150 height:16 range:[0,150,0] align:#left
	 -- local theCurve
	
	
	on btn1 pressed do
	(
		if theTool.theCurve == undefined then return undefined 
		delete $Sphere*
		theTool.distance_to_road = spn_distance_to_road.value
		theTool.createTrees()
	)
	on btn2 picked obj do
	(
		theTool.theCurve = obj
		format "Ya tengo curve\n" 
	)
)

theTreeWindow = newRolloutFloater "Tree Window" 300 220
addRollout ro_TreeGenerator theTreeWindow


-- delete $Sphere*
-- myTool = TTreeGeneratorTool theCurve:$Line001
-- myTool.createTrees()


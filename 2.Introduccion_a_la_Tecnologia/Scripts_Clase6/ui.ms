rollout ro_TreeGenerator "The Tree Generator" width:162 height:113
(
	fn onlyShapes obj = (
		return classof obj == line
	)	
	
	
	button 'btn1' "Hello" pos:[62,7] width:39 height:21 toolTip:"Super button" align:#left
	pickbutton 'btn2' "Choose Curve" pos:[37,36] width:95 height:30 enabled:true message:"Choose the Curve To Generate the trees" filter:onlyShapes align:#left
	spinner 'spn_distance_to_road' "Distance to Road" pos:[22,75] width:150 height:16 range:[0,150,0] align:#left
	local theCurve
	
	
	on btn1 pressed do
	(
			if theCurve == undefined then (
				format "No tengo curva"
			) else (
				format "La curva es % y %\n" theCurve.name spn_distance_to_road.value
			)
			-- MessageBox "Hello"
		)
	on btn2 picked obj do
	(
			theCurve = obj
			format "Ya tengo curve es %\n" theCurve.name
		)
)

theTreeWindow = newRolloutFloater "Tree Window" 300 220
addRollout ro_TreeGenerator theTreeWindow
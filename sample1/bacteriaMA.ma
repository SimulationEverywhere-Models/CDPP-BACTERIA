[top]
components : contaminacion generadorFrio@Generator
link : out@generadorFrio  inputFrio@contaminacion

[generadorFrio]
distribution : exponential
mean : 3
initial : 1
increment : 0

[contaminacion]
type : cell
dim : (10, 10, 2)
delay : inertial
defaultDelayTime : 100
border : nowrapped
neighbors : contaminacion(-1,-1,0) contaminacion(-1,0,0) contaminacion(-1,1,0)
neighbors : contaminacion(0,-1,0)  contaminacion(0,0,0)  contaminacion(0,1,0)
neighbors : contaminacion(1,-1,0)  contaminacion(1,0,0)  contaminacion(1,1,0)
neighbors : contaminacion(-1,-1,1) contaminacion(-1,0,1) contaminacion(-1,1,1)
neighbors : contaminacion(0,-1,1)  contaminacion(0,0,1)  contaminacion(0,1,1)
neighbors : contaminacion(1,-1,1)  contaminacion(1,0,1)  contaminacion(1,1,1)
in : inputFrio
link : inputFrio  in@contaminacion(0,0,1)
link : inputFrio  in@contaminacion(1,0,1)
link : inputFrio  in@contaminacion(2,0,1)
link : inputFrio  in@contaminacion(3,0,1)
link : inputFrio  in@contaminacion(4,0,1)
link : inputFrio  in@contaminacion(5,0,1)
link : inputFrio  in@contaminacion(6,0,1)
link : inputFrio  in@contaminacion(7,0,1)
link : inputFrio  in@contaminacion(8,0,1)
link : inputFrio  in@contaminacion(9,0,1)
localtransition : Evolucion
portInTransition : in@contaminacion(0,0,1)  setFrio
portInTransition : in@contaminacion(1,0,1)  setFrio
portInTransition : in@contaminacion(2,0,1)  setFrio
portInTransition : in@contaminacion(3,0,1)  setFrio
portInTransition : in@contaminacion(4,0,1)  setFrio
portInTransition : in@contaminacion(5,0,1)  setFrio
portInTransition : in@contaminacion(6,0,1)  setFrio
portInTransition : in@contaminacion(7,0,1)  setFrio
portInTransition : in@contaminacion(8,0,1)  setFrio
portInTransition : in@contaminacion(9,0,1)  setFrio
initialValue : 24
initialCellsValue : bacteria.val
zone : Temperaturas { (0,0,1)..(9,9,1) }

[Temperaturas]
rule : { ( if((-1,-1,0)!= ?,(-1,-1,0),0) + if((-1,0,0)!=?,(-1,0,0),0) + 
           if((-1,1,0)!= ?,(-1,1,0),0) + if((0,-1,0)!=?,(0,-1,0),0) + 
           if((0,1,0)!= ?,(0,1,0),0) + if((1,-1,0)!=?,(1,-1,0),0) + 
           if((1,0,0)!= ?,(1,0,0),0) + if((1,1,0)!=?,(1,1,0),0) + 
           if((0,0,0)!= ?,(0,0,0),0) ) / (if((-1,-1,0)!= ?,1,0) + if((-1,0,0)!=?,1,0) + if((-1,1,0)!= ?,1,0) + 
										  if((0,-1,0)!=?,1,0) + if((0,1,0)!= ?,1,0) + if((1,-1,0)!=?,1,0) + 
										  if((1,0,0)!= ?,1,0) + if((1,1,0)!=?,1,0) + if((0,0,0)!= ?,1,0))
        } 1000 { t }

[Evolucion]
rule : 0 10000 { cellpos(2) = 0 and (0,0,1) > 60 }
rule : { round(if((0,0,0) * 2 > 99,0.7,1) * (0,0,0) * 2)
		   + if( (-1,-1,1) != ? and (-1,-1,1) > 8 and (-1,-1,1) < 60 and round((-1,-1,0) * 2) > 99, round((-1,-1,0) * 2 * 0.1),0)
		   + if( (-1, 0,1) != ? and (-1, 0,1) > 8 and (-1, 0,1) < 60 and round((-1, 0,0) * 2) > 99, round((-1, 0,0) * 2 * 0.1),0)
		   + if( (-1, 1,1) != ? and (-1, 1,1) > 8 and (-1, 1,1) < 60 and round((-1, 1,0) * 2) > 99, round((-1, 1,0) * 2 * 0.1),0)
		   + if( ( 0,-1,1) != ? and ( 0,-1,1) > 8 and ( 0,-1,1) < 60 and round(( 0,-1,0) * 2) > 99, round(( 0,-1,0) * 2 * 0.1),0)
		   + if( ( 0, 1,1) != ? and ( 0, 1,1) > 8 and ( 0, 1,1) < 60 and round(( 0, 1,0) * 2) > 99, round(( 0, 1,0) * 2 * 0.1),0)
		   + if( ( 1,-1,1) != ? and ( 1,-1,1) > 8 and ( 1,-1,1) < 60 and round(( 1,-1,0) * 2) > 99, round(( 1,-1,0) * 2 * 0.1),0)
		   + if( ( 1, 0,1) != ? and ( 1, 0,1) > 8 and ( 1, 0,1) < 60 and round(( 1, 0,0) * 2) > 99, round(( 1, 0,0) * 2 * 0.1),0)
		   + if( ( 1, 1,1) != ? and ( 1, 1,1) > 8 and ( 1, 1,1) < 60 and round(( 1, 1,0) * 2) > 99, round(( 1, 1,0) * 2 * 0.1),0)
	   } 30000 { cellpos(2) = 0 and (0,0,1) > 8 and statecount(?) = 5 * 2 }


rule : { round(if((0,0,0) * 2 > 99,0.5,1) * (0,0,0) * 2)
		   + if( (-1,-1,1) != ? and (-1,-1,1) > 8 and (-1,-1,1) < 60 and round((-1,-1,0) * 2) > 99, round((-1,-1,0) * 2 * 0.1),0)
		   + if( (-1, 0,1) != ? and (-1, 0,1) > 8 and (-1, 0,1) < 60 and round((-1, 0,0) * 2) > 99, round((-1, 0,0) * 2 * 0.1),0)
		   + if( (-1, 1,1) != ? and (-1, 1,1) > 8 and (-1, 1,1) < 60 and round((-1, 1,0) * 2) > 99, round((-1, 1,0) * 2 * 0.1),0)
		   + if( ( 0,-1,1) != ? and ( 0,-1,1) > 8 and ( 0,-1,1) < 60 and round(( 0,-1,0) * 2) > 99, round(( 0,-1,0) * 2 * 0.1),0)
		   + if( ( 0, 1,1) != ? and ( 0, 1,1) > 8 and ( 0, 1,1) < 60 and round(( 0, 1,0) * 2) > 99, round(( 0, 1,0) * 2 * 0.1),0)
		   + if( ( 1,-1,1) != ? and ( 1,-1,1) > 8 and ( 1,-1,1) < 60 and round(( 1,-1,0) * 2) > 99, round(( 1,-1,0) * 2 * 0.1),0)
		   + if( ( 1, 0,1) != ? and ( 1, 0,1) > 8 and ( 1, 0,1) < 60 and round(( 1, 0,0) * 2) > 99, round(( 1, 0,0) * 2 * 0.1),0)
		   + if( ( 1, 1,1) != ? and ( 1, 1,1) > 8 and ( 1, 1,1) < 60 and round(( 1, 1,0) * 2) > 99, round(( 1, 1,0) * 2 * 0.1),0)
	   } 30000 { cellpos(2) = 0 and (0,0,1) > 8 and statecount(?) = 3 * 2 }

rule : { round(if((0,0,0) * 2 > 99,0.2,1) * (0,0,0) * 2)
		   + if( (-1,-1,1) != ? and (-1,-1,1) > 8 and (-1,-1,1) < 60 and round((-1,-1,0) * 2) > 99, 1,0) * round((-1,-1,0) * 2 * 0.1)
		   + if( (-1, 0,1) != ? and (-1, 0,1) > 8 and (-1, 0,1) < 60 and round((-1, 0,0) * 2) > 99, 1,0) * round((-1, 0,0) * 2 * 0.1)
		   + if( (-1, 1,1) != ? and (-1, 1,1) > 8 and (-1, 1,1) < 60 and round((-1, 1,0) * 2) > 99, 1,0) * round((-1, 1,0) * 2 * 0.1)
		   + if( ( 0,-1,1) != ? and ( 0,-1,1) > 8 and ( 0,-1,1) < 60 and round(( 0,-1,0) * 2) > 99, 1,0) * round(( 0,-1,0) * 2 * 0.1)
		   + if( ( 0, 1,1) != ? and ( 0, 1,1) > 8 and ( 0, 1,1) < 60 and round(( 0, 1,0) * 2) > 99, 1,0) * round(( 0, 1,0) * 2 * 0.1)
		   + if( ( 1,-1,1) != ? and ( 1,-1,1) > 8 and ( 1,-1,1) < 60 and round(( 1,-1,0) * 2) > 99, 1,0) * round(( 1,-1,0) * 2 * 0.1)
		   + if( ( 1, 0,1) != ? and ( 1, 0,1) > 8 and ( 1, 0,1) < 60 and round(( 1, 0,0) * 2) > 99, 1,0) * round(( 1, 0,0) * 2 * 0.1)
		   + if( ( 1, 1,1) != ? and ( 1, 1,1) > 8 and ( 1, 1,1) < 60 and round(( 1, 1,0) * 2) > 99, 1,0) * round(( 1, 1,0) * 2 * 0.1)
	   } 30000 { cellpos(2) = 0 and (0,0,1) > 8 and statecount(?) = 0 }
rule : {(0,0,0)} 10000 { cellpos(2) = 0 }

[setFrio]
rule : { uniform(-10,0)} 500 { t }

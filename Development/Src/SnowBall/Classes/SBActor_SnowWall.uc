class SBActor_SnowWall extends FracturedStaticMeshActor
	placeable
	config(SnowBall);

var config name WallMeshName;

/** Used to shut down actor on the server to reduce overhead. */
simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	//LifeSpan=50.0;
	
	
}



defaultproperties
{
	bCollideActors=TRUE
	bCollideWorld=true
	bProjTarget=TRUE
	bPathColliding=true

	bStatic=false// Does not move or change over time. It is only safe to change this property in defaultproperties.
	bNoDelete=false // Cannot be deleted during play.


    Begin Object Name=FracturedStaticMeshComponent0 
        StaticMesh=FracturedStaticMesh'SB_BaseGameType.Mesh.Player_SnowWall_FRACTURED'
    End Object

	Components.Add(FracturedStaticMeshComponent0)
}

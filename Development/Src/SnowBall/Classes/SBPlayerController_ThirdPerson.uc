class SBPlayerController_ThirdPerson extends UTPlayerController
	config(SnowBall);

// members for the custom mesh
var SkeletalMesh defaultMesh;
var MaterialInterface defaultMaterial0;
var AnimTree defaultAnimTree;
var array<AnimSet> defaultAnimSet;
var AnimNodeSequence defaultAnimSeq;
var PhysicsAsset defaultPhysicsAsset;

var config int WallConstructionCost;

/*Function responsible of placing a Wall when the key X is pressed*/
exec function ConstructWall()
{
	SBBot_Custom(Pawn).StartConstructing();
	PushState('CreateWall');
}

state CreateWall 
{	

	 function StopConstructingWall()
	 {
		SBBot_Custom(Pawn).StopConstructing();
		PopState();
	 }

	 function CompletedConstruction()
	 {
		PopState();
	 }

	exec  function ConstructWall()
	{
		StopConstructingWall();
	}
}

simulated function PostBeginPlay() 
{
	super.PostBeginPlay();
}

// Sets the Pawns Mesh to the resources speced in the DefaultProperties
public function resetMesh()
{
	local PostProcessChain coolShade;

	Pawn.Mesh.SetSkeletalMesh(defaultMesh);
	Pawn.Mesh.SetMaterial(0,defaultMaterial0);
	Pawn.Mesh.SetPhysicsAsset(defaultPhysicsAsset );
	Pawn.Mesh.AnimSets=defaultAnimSet;
	Pawn.Mesh.SetAnimTreeTemplate(defaultAnimTree);

	if (LocalPlayer(Player)!=none)
	{
		coolShade = PostProcessChain'SB_PostProcessing.PostProcess.DunDefScenePostProcess';
		LocalPlayer(Player).RemoveAllPostProcessingChains();
		LocalPlayer(Player).InsertPostProcessingChain(coolShade,-1,false);
	}
}

// Called at RestartPlayer by GameType
public function rSetBehindView(bool view)
{
	SetBehindView(view);
}

// Called at RestartPlayer by GameType
public function rSetCameraMode(name cameraSetting)
{
	SetCameraMode(cameraSetting);
}

DefaultProperties
{
	//defaultMesh=SkeletalMesh'CH_IronGuard_Male.Mesh.SK_CH_IronGuard_MaleA'
	defaultMesh=SkeletalMesh'SB_Characters.Mesh.SK_CH_TestCharacter'
	defaultAnimTree=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
	defaultAnimSet(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
	defaultPhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
}

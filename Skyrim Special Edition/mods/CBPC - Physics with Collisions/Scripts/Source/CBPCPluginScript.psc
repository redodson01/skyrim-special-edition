scriptName CBPCPluginScript hidden

String function GetVersion() global native

String function GetVersionMinor() global native

String function GetVersionBeta() global native

function ReloadConfig() global native

function StartPhysics(Actor npc, String nodeName) global native

function StopPhysics(Actor npc, String nodeName) global native

bool function AttachColliderSphere (Actor npc, String nodeName, float[] position, float radius, float scaleWeight, int index, bool isAffectedNode = false)  global native

bool function AttachColliderCapsule (Actor npc, String nodeName, float[] end1_position, float end1_radius, float[] end2_position, float end2_radius, float scaleWeight, int index, bool isAffectedNode = false)  global native

bool function DetachCollider (Actor npc, String nodeName, int type, int index,  bool isAffectedNode = false) global native

function ApplyCollisionInterpolation(Actor npc, String uniqueName, int percentage) global native

function ApplyBounceInterpolation(Actor npc, String uniqueName, int percentage) global native

function RefreshActorBounceSettings(Actor npc) global native

function RefreshActorCollisionSettings(Actor npc) global native
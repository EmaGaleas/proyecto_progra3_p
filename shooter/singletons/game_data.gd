extends Node


enum ENEMY_TYPE { ZIPPER, BIO, BOMBER }
enum POWERUP_TYPE { HEALTH, SHIELD }

const GROUP_PLAYER: String = "player"
const GROUP_HOMMING_MISILE: String = "homming_misile"
const GROUP_SAURCER: String = "saurcer"
const GROUP_ESHIP: String = "enemy_ship"
const GROUP_BULLET: String = "bullet"

const MISILE_DAMAGE: int = 10
const COLLISION_DAMAGE: int = 40

const POWER_UPS = {
	POWERUP_TYPE.HEALTH: preload("res://shooter/assets_sht/misc/powerupGreen_bolt.png"),
	POWERUP_TYPE.SHIELD: preload("res://shooter/assets_sht/misc/shield_gold.png")
}

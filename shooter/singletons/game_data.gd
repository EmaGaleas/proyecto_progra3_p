extends Node


enum ENEMY_TYPE { ZIPPER, BIO, BOMBER }
enum POWERUP_TYPE { HEALTH, SHIELD }

const GROUP_PLAYER: String = "player"

const POWER_UPS = {
	POWERUP_TYPE.HEALTH: preload("res://shooter/assets_sht/misc/powerupGreen_bolt.png"),
	POWERUP_TYPE.SHIELD: preload("res://shooter/assets_sht/misc/shield_gold.png")
}

extends HurtboxComponent

@onready var damage_interval_timer: Timer = $"../DamageIntervalTimer"

var number_colliding_bodies := 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	damage_interval_timer.timeout.connect(_on_damage_interval_timer_timeout)
	
	
func check_deal_damage():
	if number_colliding_bodies == 0 || !damage_interval_timer.is_stopped():
		return
		
	create_damage(1)
	damage_interval_timer.start()
	print("[health] %d" % health_component.cur_health)
	

func _on_body_entered(body: Node2D):
	number_colliding_bodies += 1
	check_deal_damage()


func _on_body_exited(body: Node2D):
	number_colliding_bodies -= 1
	

func _on_damage_interval_timer_timeout():
	check_deal_damage()

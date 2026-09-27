extends SceneTree

var failures := 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	print("PASS " if ok else "FAIL ", label)
	if not ok:
		failures += 1
func key(code: Key, pressed: bool) -> void:
	var event := InputEventKey.new()
	event.physical_keycode = code
	event.pressed = pressed
	Input.parse_input_event(event)
func run() -> void:
	var demo: Node = load("res://world.tscn").instantiate()
	root.add_child(demo)
	var player: CharacterBody2D = demo.get_node("Player")
	var secret: TileMapLayer = demo.get_node("Secret")
	await create_timer(0.2).timeout
	check(player.is_on_floor(), "starts on solid floor")
	check(not secret.player_in_secret, "starts outside secret")
	key(KEY_D, true)
	for i in 125:
		await physics_frame
	key(KEY_D, false)
	await create_timer(0.9).timeout
	print("ENTER_POSITION ", player.position)
	check(player.position.x > 224 and player.position.x < 336, "D input crosses fake wall")
	check(secret.player_in_secret, "area detects player inside")
	check(is_equal_approx(secret.layer_alpha, 0.3) and is_equal_approx(secret.self_modulate.a, 0.3), "secret fades to 0.3")
	check(not secret.is_processing(), "fade stops processing at target")
	check(player.is_on_floor(), "solid ground still collides")
	key(KEY_A, true)
	for i in 125:
		await physics_frame
	key(KEY_A, false)
	await create_timer(0.9).timeout
	check(not secret.player_in_secret, "A input exits detector")
	check(is_equal_approx(secret.layer_alpha, 1.0) and is_equal_approx(secret.self_modulate.a, 1.0), "opacity restored")
	check(not secret.is_processing(), "restored fade stops processing")
	key(KEY_W, true)
	for i in 5:
		await physics_frame
	key(KEY_W, false)
	check(player.velocity.y < 0, "W input jumps")
	print("HEADLESS INPUT/PHYSICS ONLY; no visual capture or films verified; failures=", failures)
	demo.queue_free()
	await process_frame
	quit(1 if failures else 0)

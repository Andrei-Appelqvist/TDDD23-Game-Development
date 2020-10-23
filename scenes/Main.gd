extends Node2D
var player
var entered_area = {}
func _ready():
    player = $player
    load_game()

func _input(event):
    #if event.is_action_pressed("ui_down"):
        #get_tree().quit()
    if event.is_action_pressed("ui_left"):
        player.queue_free()
        player = load("res://scenes/player/player.tscn").instance()
        add_child(player)
    #elif event.is_action_pressed("ui_up"):
        #save_game()
    elif event.is_action_pressed("ui_cancel"):
        save_game()
        get_tree().change_scene("res://scenes/färdiga_scener/Menu.tscn")

func _notification(what):
    if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
        save_game()
        get_tree().quit() # default behavior



func save_game():
    print("entered save")
    var save_game = File.new()
    save_game.open("user://savegame.save", File.WRITE)
    var save_nodes = get_tree().get_nodes_in_group("Persist")
    for node in save_nodes:
        # Check the node is an instanced scene so it can be instanced again during load.
        if node.filename.empty():
            print("persistent node '%s' is not an instanced scene, skipped" % node.name)
            continue

        # Check the node has a save function.
        if !node.has_method("save"):
            print("persistent node '%s' is missing a save() function, skipped" % node.name)
            continue

        # Call the node's save function.
        var node_data = node.call("save")

        # Store the save dictionary as a new line in the save file.
        save_game.store_line(to_json(node_data))
    save_game.close()
    print("saving done")

func load_game():
    var save_game = File.new()
    if not save_game.file_exists("user://savegame.save"):
        player.play_song(0, true)
        return

    var save_nodes = get_tree().get_nodes_in_group("Persist")
    for i in save_nodes:
        i.queue_free()

    # Load the file line by line and process that dictionary to restore
    # the object it represents.
    save_game.open("user://savegame.save", File.READ)
    while save_game.get_position() < save_game.get_len():
        # Get the saved dictionary from the next line in the save file
        var node_data = parse_json(save_game.get_line())

        # Firstly, we need to create the object and add it to the tree and set its position.
        player = load(node_data["filename"]).instance()
        get_node(node_data["parent"]).add_child(player)
        player.position = Vector2(node_data["pos_x"], node_data["pos_y"])
        player.rotation_degrees = node_data["rotation"] + 180
        player.set_start_speed(Vector2(node_data["force_x"], node_data["force_y"]))
        player.current_song = node_data["music"]
        # Now we set the remaining variables.
        """
        for i in node_data.keys():
            if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y" or i == "rotation":
                continue
            new_object.set(i, node_data[i])
        """
    save_game.close()

func _on_Area2D_body_entered(body):
    player.play_song(1)
    pass # Replace with function body.

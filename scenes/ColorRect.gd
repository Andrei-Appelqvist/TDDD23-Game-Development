extends ColorRect


signal fade_complete()

enum {FADE_IN, FADE_OUT}

var fade_info

#demo
func _ready():
    self.modulate.a = 0


func fade(duration, direction=FADE_OUT):
    yield(get_tree().create_timer(5), "timeout")
    fade_info = {
        'time-left': duration,
        'dest-alpha': 1 if direction == FADE_IN else 0
    }

func _process(delta):
    if fade_info != null:
        fade_info['time-left'] -= delta
        if fade_info['time-left'] < delta:
            self.modulate.a = fade_info['dest-alpha']
            fade_info = null
            emit_signal('fade_complete')
        else:
            var time_left_ratio = delta / fade_info['time-left']
            self.modulate.a += (fade_info['dest-alpha'] - self.modulate.a) * time_left_ratio


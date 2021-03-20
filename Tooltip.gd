extends MarginContainer

onready var anim = $AnimationPlayer
onready var label = $M2/H1/CenterLabel/Label
var showing = false


var placement_offset :=Vector2(0.0,0.0)
var placement:=Vector2(0,0)

func _ready():
	#ui_signals is an autoloaded signal repository.
	ui_signals.connect("toggle_tooltip",self,"_on_toggle_tooltip")
	showing=false
	anim.seek(0)
	
func _process(delta):
	if showing:
		placement_offset.y = -self.rect_size.y
		self.set_global_position(placement + placement_offset)
		self.set_size(Vector2(10.0,10.0))
	
func _on_toggle_tooltip(do_show,node, tooltip_type):
	self.set_size(Vector2(10.0,10.0))
	placement = node.rect_global_position
	placement_offset.y = -self.rect_size.y
	var half_width = get_viewport_rect().size.x*.75	
	if placement.x < half_width:
		placement_offset.x =0
	else:
		placement_offset.x = -self.rect_size.x 
	if do_show:
		if not showing:
			
			label.text = tooltip_type
			anim.play("ShowTooltip")
	else:
		if showing:
			anim.play_backwards("ShowTooltip")	
	showing = do_show


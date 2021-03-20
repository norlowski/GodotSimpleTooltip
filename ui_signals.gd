extends Node


signal toggle_tooltip(do_show,tooltip_type)


#you can put other stuff here, like maybe a path to a custom panel to put
#into the tooltip scene. I have basiscs like which type it is and where it should
#be positioned.
func register_tooltip(control_node, tooltip_type):
	control_node.connect("mouse_entered",self,"_on_show_tooltip",[control_node,tooltip_type])
	control_node.connect("mouse_exited",self,"_on_hide_tooltip",[control_node,tooltip_type])
	

#The register_tooltip method essentially adds these methods to each class 
# you're registering a tooltip for. This makes adding a tooltip possible in 
# a root node without having to create a script for every UI element in the
# ui scene. See Button.gd
func _on_show_tooltip(node,tooltip_type):
	emit_signal("toggle_tooltip",true, node, tooltip_type)
	
func _on_hide_tooltip(node,tooltip_type):
	emit_signal("toggle_tooltip",false, node, tooltip_type)

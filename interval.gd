class_name Interval

var id: int = 0
var intervalInSeconds: float = 0.0
var callable: Callable
var deferred: bool = false
var src: Node = null
var elapsed: float = 0.0

func _init(_id: int, _intervalInSeconds: float, _callable: Callable, _deferred = false, _src: Node = null) -> void:
	id = _id
	intervalInSeconds = intervalInSeconds
	callable = _callable
	deferred = _deferred
	src = _src

func run() -> void:
	if deferred:
		callable.call_deferred()
	else:
		callable.call()

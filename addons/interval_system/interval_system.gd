extends Node

var intervals: Dictionary = {}

func create(
	intervalInSecunds: float,
	callable: Callable,
	deferred = false,
	src: Node = null
) -> int:
	var interval_id = randi()
	while intervals.has(interval_id):
		interval_id = randi()

	intervals[interval_id] = Interval.new(
		interval_id,
		intervalInSecunds,
		callable,
		deferred,
		src
	)

	if (src != null):
		src.tree_exited.connect(func(): clear(interval_id))

	return interval_id

func clear(interval_id: int) -> bool:
	if intervals.has(interval_id):
		intervals.erase(interval_id)
		return true
	
	return false

func _process(delta: float) -> void:
	for interval_id in intervals.keys():
		var interval: Interval = intervals[interval_id]
		interval.elapsed = min(interval.elapsed + delta, interval.intervalInSeconds * 2)

		if interval.elapsed >= interval.intervalInSeconds:
			interval.run()
			interval.elapsed = min(interval.elapsed - interval.intervalInSeconds, 0)

extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var data = getCsvfileHandleAsArray("res://test.csv")
	print(data)
	print("##########")
	print(data[0])
	print("###########")
	print(data[1])
	print("###########")
	print(data[0]['id'])
	print(data[0]['title'])
	print(data[0]['description'])
	pass # Replace with function body.

func getCsvfileHandleAsArray(fileHandlePath):
	var fileHandle = FileAccess.open(fileHandlePath, FileAccess.READ)
	var data = {}
	var header = null
	
	while !fileHandle.eof_reached():
		var dataRow = Array(fileHandle.get_csv_line())
		
		if(header == null):
			header = dataRow
			continue
			
		var row = {}

		for index in range(dataRow.size()):
			row[header[index]] = dataRow[index]

		data[data.size()] = row
		
	fileHandle.close()
	
	return data

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

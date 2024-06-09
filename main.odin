package Append

import "core:fmt"
import "core:os"

original_png_name: string = "00.png"
project_png_name: string = "01.proj.png"
content: string = "JaneRudeOvO"
file: [dynamic]byte


main :: proc() {
	read_png()
	write_png()
}

read_png :: proc() {

	data, ok := os.read_entire_file_from_filename(original_png_name)
	if !ok {
		fmt.eprintln("Failed to load the file!")
		return
	}
	append(&file, ..data[:])
}

write_png :: proc() {
	append(&file, content)
	os.write_entire_file(project_png_name, file[:], true)
}

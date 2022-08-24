package jreleaser

import (
	"universe.dagger.io/docker"
)

#Version: {
    version: string | *"latest"

	_image: #Image & {
        tag: version
    }
    
	docker.#Run & {
		input:   *_image.output | docker.#Image
		command: {
            name: "jreleaser"
            args: ["-V"]
        }
	}
}
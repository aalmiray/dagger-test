package jreleaser

import (
	"universe.dagger.io/docker"
)

// Prints the version
#Version: {
    // --== Public ==--

    // JReleaser version
    version: string | *"latest"

    // --== Private ==--

	_image: #Image & {
        "version": version
    }
    
	docker.#Run & {
		input:   *_image.output | docker.#Image
		command: {
            name: "-V"
        }
	}
}
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
package jreleaser

import (
	"dagger.io/dagger"
	"universe.dagger.io/docker"
)

// Base
#Container: {
    // --== Public ==--

    // Source code
	source: dagger.#FS
    
    // JReleaser version
    version: string | *"latest"

    // JReleaser command to be executed
    command: string
    
    // Additional command arguments
	args: [...string]

    // Additional command flags
	flags: [string]: (string | true)

    // --== Private ==--

	_image: #Image & {
        "version": version
    }

	_sourcePath: "/workspace"

	_container: docker.#Run & {
		input:   *_image.output | docker.#Image
		workdir: _sourcePath
		"command": {
            name: command
            "args": args
            "flags": flags
        }
		mounts: "source": {
			dest:     _sourcePath
			contents: source
		}
        export: directories: "/out": _
	}
    
    // --== Outputs ==--

    output: _container.export.directories."/out"
}

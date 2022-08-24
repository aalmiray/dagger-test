package jreleaser

import (
	"dagger.io/dagger"
    //"dagger.io/dagger/core"
	"universe.dagger.io/docker"
)

// Base
#Container: {
    // --== Public ==--

    // Source code
	source: dagger.#FS

    // JReleaser home path
    jreleaser_home?: dagger.#FS
    
    // JReleaser version
    version: string | *"latest"

    // JReleaser command to be executed
    command: string
    
    // Additional command arguments
	args: [...string]

    // Additional command flags
	flags: [string]: (string | true)

	// Environment variables
    env: [string]: string | dagger.#Secret

    // --== Private ==--

	_image: #Image & {
        "version": version
    }

	_sourcePath: "/workspace"

	_container: docker.#Run & {
		input:   *_image.output | docker.#Image
		workdir: _sourcePath
		"command": {
            name:     command
            "args":   args
            "flags":  flags
        }
        "env":    env & {
            JRELEASER_USER_HOME: "/.jreleaser"
        }
		mounts: {
            "source": {
			    dest:     _sourcePath
			    contents: source
            }

            if jreleaser_home != _|_ {
                "jreleaser_home": {
			        dest:     "/.jreleaser"
			        contents: jreleaser_home
                }
            }
		}
        export: directories: "out": _
	}
    
    // --== Outputs ==--

    output: _container.export.directories."out"
}

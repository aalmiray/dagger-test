package jreleaser

import (
	"dagger.io/dagger"
	"universe.dagger.io/docker"
)

#Container: {
    source:  dagger.#FS
    
    version: string
    
	args: [...string]

	flags: [string]: (string | true)

	_image: #Image & {
        tag: version
    }

	_sourcePath: "/workspace"

	_container: docker.#Run & {
		input:   *_image.output | docker.#Image
		workdir: _sourcePath
		command: {
            name: "jreleaser"
            "args": args
            "flags": flags
        }
		mounts: "source": {
			dest:     _sourcePath
			contents: source
		}
        export: directories: "/out": _
	}
    
    output: _container.export.directories."/out"
}

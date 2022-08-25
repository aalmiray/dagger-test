package main

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "universe.dagger.io/bash"
    "github.com/jreleaser/jreleaser"
)

dagger.#Plan & {
    client: filesystem: "~/.jreleaser": read: {
        contents: dagger.#FS
    }
    
    actions: {
        c: jreleaser.#Checksum & {
            source: _source.output
            _source: core.#Source & {
	            path: "."
	        }
            jreleaser_home: client.filesystem."~/.jreleaser".read.contents
            env: {
                JRELEASER_PROJECT_VERSION: "1.0.0"
            }
        }

        s: bash.#Run & {
            always: true
            input:  c.output
            script: contents: """
                    echo "\(c.outputProps)"
                    """
        }
    }
}
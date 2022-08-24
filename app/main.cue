package main

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
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
    }
}
package main

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "github.com/jreleaser/jreleaser"
)

dagger.#Plan & {
    actions: {
        hello: jreleaser.#Config & {
            source: _source.output
            _source: core.#Source & {
	            path: "."
	        }
        }
    }
}
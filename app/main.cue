package main

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "github.com/jreleaser/jreleaser"
)

dagger.#Plan & {
    actions: {
        v: jreleaser.#Version & {
        }
        c: jreleaser.#Config & {
            source: _source.output
            _source: core.#Source & {
	            path: "."
	        }
        }
    }
}
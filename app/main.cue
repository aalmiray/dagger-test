package main

import (
    "dagger.io/dagger"
    "dagger.io/dagger/core"
    "github.com/jreleaser/jreleaser"
)

dagger.#Plan & {
    actions: {
        //hello: jreleaser.#Version & {
        //}
        hello: jreleaser.#Config & {
            source: core.#Source & {
	            path: "."
	        }
        }
    }
}
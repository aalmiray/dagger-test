package jreleaser

import(
	"universe.dagger.io/docker"
)

// JReleaser image
#Image: {
    // --== Public ==--

    // JReleaser version
    version: string | *"latest"

    docker.#Pull & {
        source: "jreleaser/jreleaser-slim:\(version)"
    }
}

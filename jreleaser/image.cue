package jreleaser

import(
	"universe.dagger.io/docker"
)

#Image: {    
   version: string | *"latest"
   
   docker.#Pull & {
       source: "jreleaser/jreleaser-slim:\(version)"
   }
}

package jreleaser

import(
	"universe.dagger.io/docker"
)

#Image: {    
   tag: string | *"latest"
   
   docker.#Pull & {
       source: "jreleaser/jreleaser-slim:\(tag)"
   }
}

package jreleaser

import (
    "dagger.io/dagger"
)

#Config: {
    version: string
    
	source: dagger.#FS
    
	#Container & {
        "version": version
        "source": source
		args: ["config"]
	}
}
package jreleaser

import (
    "dagger.io/dagger"
)

// Base command
#Command: {
    // --== Public ==--

    // Source code
    source: dagger.#FS

    // JReleaser home path
    jreleaser_home?: dagger.#FS

    // JReleaser version
    version: string | *"latest"

    // JReleaser command to be executed
    cmd: string

    // Additional command arguments
    args: [...string]

    // Additional command flags
    flags: [string]: (string | true)

    // Environment variables
    env: [string]: string | dagger.#Secret

    container: #Container & {
        "jreleaser_home": jreleaser_home
        "source":         source
        "version":        version
        "cmd":            cmd
        "args":           args
        "flags":          flags
        "env":            env
        export: {
            directories: "out/jreleaser": _
            files: {
                "out/jreleaser/trace.log": _
                "out/jreleaser/output.properties": _
            }
        }
    }
    
    // --== Outputs ==--

    output: {
        outdir: container.export.directories."out/jreleaser"
        trace:  container.export.files."out/jreleaser/trace.log"
        props:  container.export.files."out/jreleaser/output.properties"
    }
}

#Config: #Command & {
    cmd: "config"
}

#Download: #Command & {
    cmd: "download"
}

#Assemble: #Command & {
    cmd: "assemble"
}

#Changelog: #Command & {
    cmd: "changelog"
}

#Checksum: #Command & {
    cmd: "checksum"
}

#Sign: #Command & {
    cmd: "sign"
}

#Upload: #Command & {
    cmd: "upload"
}

#Release: #Command & {
    cmd: "release"
}

#Prepare: #Command & {
    cmd: "prepare"
}

#Package: #Command & {
    cmd: "package"
}

#Publish: #Command & {
    cmd: "publish"
}

#Announce: #Command & {
    cmd: "announce"
}

#FullRelease: #Command & {
    cmd: "full-release"
}
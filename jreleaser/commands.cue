package jreleaser

import (
    "dagger.io/dagger"
)

#JReleaserCommand: "download" | "assemble" | "changelog" | "checksum" | "sign" | "upload" | "release" | "prepare" | "package" | "publish" | "announce" | "full-release"

// Base command
_#Command: {
    // --== Public ==--

    // Source code
    source: dagger.#FS

    // JReleaser home path
    jreleaser_home?: dagger.#FS

    // JReleaser version
    version: string | *"latest"

    // JReleaser command to be executed
    cmd: #JReleaserCommand

    // Additional command arguments
    args: [...string]

    // Additional command flags
    flags: [string]: (string | true)

    // Environment variables
    env: [string]: string | dagger.#Secret

    _container: #Container & {
        "jreleaser_home": jreleaser_home
        "source":         source
        "version":        version
        "cmd":            cmd
        "args":           args
        "flags":          flags
        "env":            env
        export: {
            directories: "/out/jreleaser": dagger.#FS
            files: {
                "/out/jreleaser/trace.log":         string
                "/out/jreleaser/output.properties": string
            }
        }
    }

    // --== Outputs ==--

    output:      _container.output
    outputDir:   _container.export.directories["/out/jreleaser"]
    outputLog:   _container.export.files["/out/jreleaser/trace.log"]
    outputProps: _container.export.files["/out/jreleaser/output.properties"]
}

#Config: _#Command & {
    cmd: "config"
}

#Download: _#Command & {
    cmd: "download"
}

#Assemble: _#Command & {
    cmd: "assemble"
}

#Changelog: _#Command & {
    cmd: "changelog"
}

#Checksum: _#Command & {
    cmd: "checksum"
}

#Sign: _#Command & {
    cmd: "sign"
}

#Upload: _#Command & {
    cmd: "upload"
}

#Release: _#Command & {
    cmd: "release"
}

#Prepare: _#Command & {
    cmd: "prepare"
}

#Package: _#Command & {
    cmd: "package"
}

#Publish: _#Command & {
    cmd: "publish"
}

#Announce: _#Command & {
    cmd: "announce"
}

#FullRelease: _#Command & {
    cmd: "full-release"
}
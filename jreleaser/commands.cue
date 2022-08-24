package jreleaser

// Base command
#Command: #Container & {
}

#Init: #Command & {
    command: "init"
}

#Config: #Command & {
    command: "config"
}

#Template: #Command & {
    command: "template"
}

#Download: #Command & {
    command: "download"
}

#Assemble: #Command & {
    command: "assemble"
}

#Changelog: #Command & {
    command: "changelog"
}

#Checksum: #Command & {
    command: "checksum"
}

#Sign: #Command & {
    command: "sign"
}

#Upload: #Command & {
    command: "upload"
}

#Release: #Command & {
    command: "release"
}

#Prepare: #Command & {
    command: "prepare"
}

#Package: #Command & {
    command: "package"
}

#Publish: #Command & {
    command: "publish"
}

#Announce: #Command & {
    command: "announce"
}

#FullRelease: #Command & {
    command: "full-release"
}
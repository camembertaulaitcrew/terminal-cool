#!/usr/bin/env coffee

process.title = 'terminal-cool'
tty = require 'tty.js'
url = require 'url'

shell = process.argv[2] || "/bin/bash"
shellArgs = process.argv[3...]

console.log "shell command is #{shell} with parameters #{shellArgs}"

config =
  port: 8080
  hostname: "0.0.0.0"
  shell: shell
  shellArgs: shellArgs
  static: "./static"
  limitGlobal: 100
  limitPerUser: 10
  localOnly: false
  cwd: "/tmp"
  syncSession: false
  sessionTimeout: 600000
  log: true
  io:
    log: true
  debug: true
  term:
    termName: "xterm"  # xterm-256color ?
    geometry: [80, 24]
    scrollback: 1000
    visualBell: true
    popOnBell: false
    cursorBlink: true
    screenKeys: false
    colors: [
      "#2e3436"
      "#cc0000"
      "#4e9a06"
      "#c4a000"
      "#3465a4"
      "#75507b"
      "#06989a"
      "#d3d7cf"
      "#555753"
      "#ef2929"
      "#8ae234"
      "#fce94f"
      "#729fcf"
      "#ad7fa8"
      "#34e2e2"
      "#eeeeec"
    ]

app = tty.createServer config

app.listen()

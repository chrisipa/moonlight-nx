![Build](https://github.com/rock88/moonlight-nx/workflows/Build/badge.svg)

# Moonlight-NX

Moonlight-NX is a port of [Moonlight Game Streaming Project](https://github.com/moonlight-stream "Moonlight Game Streaming Project") for Nintendo Switch.

# Installing
1. Download latest Moonlight-NX [release](https://github.com/rock88/moonlight-nx/releases) or [automatic build](https://github.com/rock88/moonlight-nx/actions?query=workflow%3ABuild+is%3Asuccess) (require github login for artifacts link appear);
2. Put moonlight.nro to sdcard:/switch/moonlight;
3. Launch hbmenu over *Title Redirection* (for FULL RAM access);
4. Launch moonlight.

# Controls (Defaults)
1. Move cursor with move finger on touch screen;
2. Scroll with two fingers;
3. L/R + tap on screen - Left/Right mouse click (allow to move cursor);
4. ZL/ZR + tap on screen - Left/Right mouse click (without move cursor);
5. L+R+Down - exit from stream (and close current app);
6. L+R+Up - exit from stream (without closing current app);
7. L+R+Left - Alt+Enter (for enable/disable fullscreen mode);
8. L+R+Right - ESC key;
9. ZL+ZR+Left - show video decoder/render stats;
10. ZL+ZR+Right - hide video decoder/render stats;
11. Minus+Plus - Guide button;

# Build Moonlight-NX
1. Clone this repo and its submodules: `git clone --recursive https://github.com/rock88/moonlight-nx.git`
2. Change directory to cloned repo: `cd moonlight-nx`
3. Build a Docker image for the dev environment: `docker build . -t moonlight-nx-build`
4. Run the build script in the Docker container for the dev environment and copy nro to Nintendo Switch using nxlink: `docker run -it --rm -e SWITCH_HOST=192.168.0.1 -v $(pwd):/moonlight-nx moonlight-nx-build`

# Assets
Icon - [moonlight-stream](https://github.com/moonlight-stream "moonlight-stream") project logo.

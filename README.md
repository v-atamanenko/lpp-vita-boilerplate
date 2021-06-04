# lpp-vita-boilerplate
**No-fuss Lua development environment for Vita homebrew makers**

---

LPP-Vita-Boilerplate is a Vagrant-based boilerplate to jumpstart your [Lua Player Plus Vita](https://github.com/Rinnegatamante/lpp-vita) development on *nix, OS X, and Windows. Heavily based on
azure-pipelines of [lpp-vita by @Rinnegatamante](https://github.com/Rinnegatamante/lpp-vita/blob/master/azure-pipelines.yml)
and dockerfile of [vitasdk-docker by @gnuton](https://github.com/gnuton/vitasdk-docker/blob/master/Dockerfile)

By default, the application will run [GUI sample of lpp-vita](https://github.com/Rinnegatamante/lpp-vita/blob/master/samples/Gui/index.lua).

## Getting started

1. Download and install [Vagrant](https://www.vagrantup.com/downloads)
2. Clone this repository via git: `git clone https://github.com/v-atamanenko/lpp-vita-boilerplate/` or, alternatively, simply download
a [ZIP-archive of its contents](https://github.com/v-atamanenko/lpp-vita-boilerplate/archive/refs/heads/master.zip).
3. Navigate to `lpp-vita-boilerplate` directory and run `bash build.sh`. For the first run, get a cup of coffee and wait 5-15 minutes until everything gets installed and compiled. Each next run will take just a few seconds.
4. The VPK file should appear in the `lpp-vita-boilerplate` directory and be ready to use on your hacked Vita!

## Adapting to your project

[Partly copied from the LPP-Vita readme]

- Place index.lua file in build folder.
- Customize images in build/sce_sys and build/sce_sys/livearea/contents with your own images (make sure to compress them with pngquant).
- You can place in build folder whatever file you want. Such files will be usable in your homebrew in app0 filesystem. For example if you place an image in build/image.jpg, it will be usable in your script as app0:/image.jpg.
- Edit build.conf to set the name, id, and type of eboot (safe or unsafe) for your homebrew.

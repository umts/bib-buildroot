BusInfoBoard buildroot
======================

This repo is for building a minimal Linux distribution for purposes of
displaying the [BusInfoBoard][bib]. It contains just the software
required to run the Midori web browser and it automatically logs in
to a non-root user to do so.

The following platforms are supported:

*  i386 live CD
*  Raspberry Pi

Building
--------

Building is done with [buildroot][br]. Download the latest stable
release and from within the buildroot tree, load the configuration:

```bash
$ BR2_EXTERNAL=/path/to/this/repo make rpibib_defconfig #Rasperry Pi
$ #  or
$ BR2_EXTERNAL=/path/to/this/repo make lcdbib_defconfig #Live CD
```

And then fire off the build. This will take a very long time (hours), so
maybe go find some other work to do.

```bash
$ make
```

Writing the image
-----------------

The finished images are in the `output/images/` directory. For the live
CD, it will be named `rootfs.iso`; burn it using the tool of your choice (also
works in Virtualbox). For the Raspberry Pi, it will be named `sdcard.img`;
write it to a microSD card with `dd` (replace X with the correct letter):

```bash
$ sudo dd if=output/images/sdcard.img of=/dev/sdX
```

Per-device configuration
------------------------

You can configure the particulars of the BusInfoBoard display with a
`bib_config.json` file. For the live CD, place it in the root of any removable
USB device. For the Raspberry Pi, place it in the FAT32 partition of the SD
card. Configuration details are documented in the BusInfoBoard README.

[bib]: https://github.com/umts/BusInfoBoard/
[br]: https://buildroot.uclibc.org/

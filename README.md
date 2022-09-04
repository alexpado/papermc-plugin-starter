# PaperMC Plugin Starter

This project is a template to start coding your plugin in no time.

Unlike the previous version of this template (see `legacy` branch), this one work both on Linux and Windows, as long as
you have docker installed.

> **NOTE:** If you want to use minecraft version 1.16.5 or earlier, you'll need to switch to the legacy branch.

### Development Requirements

- JDK 17
- Docker (if you want to lazily setup your test server)

### Changing the dependency version

1. Open the `build.gradle` file.
2. Locate the `implementation` line under the `dependencies` category.
3. Change the `version` property to your needs.

[View all version available](https://repo.papermc.io/service/rest/repository/browse/maven-public/io/papermc/paper/paper-api/)
.

### Changing the minecraft version for Docker

Just change the value of `PAPER_VERSION` in the `.env` file. You can also use a specific build by changing the value
of `PAPER_BUILD`.  You'll probably need to rebuild the image.

> Please note that `PAPER_VERSION` need to be a version group, not a specific minecraft version (eg: `1.19` and
> not `1.19.x`).

### Manual installation (Linux Only)

##### Requirements
- curl
- jq
- JDK 17

##### Steps

1. Run the `start.sh` script by providing the minecraft version group (and optionally the paper build you want to download)
   1. `./start.sh` (if `PAPER_VERSION` set in `.env`) 
   2. `PAPER_VERSION=1.19 ./start.sh`
   3. `PAPER_VERSION=1.19 PAPER_BUILD=138 ./start.sh`
2. Probably accept EULA in `eula.txt` and modify your server properties.
3. Enjoy

*Or simply use the `Start Local` run configuration in IntelliJ...*

> If you want to download a new jar file, you'll have to remove the existing one.

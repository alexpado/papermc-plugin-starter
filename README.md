# PaperMC Plugin Starter
**NOTE : This template support only Linux. If you want to use it on Windows, you'll have to create your own run configurations.**

This project is a template to start coding your plugin in no time. It's IntelliJ-ready with run configurations already done.

If you're going to use it for the first time, please ready carefully all this readme, it won't be long.

#### Changing the dependency version
1. Open the `build.gradle` file.
2. Locate the `implementation` line under the `dependencies` category.
3. Change the `version` property to your needs.

[View all version available](https://papermc.io/repo/service/rest/repository/browse/maven-public/com/destroystokyo/paper/paper-api/).

### Changing the workspace location & settings
By default, all run configurations points to the `.papermc` directory.

1. Open the `start.sh` file in your project root directory.
2. Change the first 3 lines to your needs. For the **paper build** or the **minecraf version**, please refer to [the main papermc downloads page](https://papermc.io/downloads). _Please note that the workspace will be created under the user home folder._
3. Open the `build.gradle` file and change the workspace variable here.

**NOTE : The workspace inside the start.sh file and the build.gradle file have to be the same.**
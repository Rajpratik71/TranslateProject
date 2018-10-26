Lutris: Linux game management made easy
======

Install, configure, and launch all your Linux games from a single interface with this open source gaming platform.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/lutris-games.png?itok=kHy2MhlR)

If you use Linux and enjoy playing video games, life has been pretty good lately. Valve, Unity, Unreal Engine, and other big-name forces have pulled the video game industry into Linux compatibility so thoroughly that if you use Steam, you likely own more Linux-compatible games than you have time to play (and with [Proton and Steam Play][1], that number's about to increase).

If you're a fan of indie games, [Itch.io][2] and a wide variety of game sprints such as the [Open Jam][3] are making it easy to find truly excellent games for Linux. Vendors like [GOG.com][4] and [Humble Bundle][5] offer lots of games new and old. And finally, you can find plenty of games in your distribution's repositories, game emulators for old consoles, and online games.

For the first time in ages, Linux users can enjoy an embarrassment of game riches, and that poses a question: How do you manage them all? The open source answer is [Lutris][6].

![lutris desktop client][8]

The Lutris desktop client

### The Lutris desktop client

Lutris is an open source desktop client that manages your diverse game library. No matter what form a game takes, if it's on your computer, you can add it to Lutris. And that means when you want to play a game, you don't need to remember whether the game's installed to **~/GOG Games** , **~/Games** , your application menu, or **/usr/games** —or if it exists only in a browser, it's in Steam, or it needs to be launched in an emulator. All your games are in one place: your Lutris app.

### Installing Lutris

Lutris is probably available from your software repository, but if not, you can [download it directly][9] as a tarball. For more information, see [How to install software applications on Linux][10].

### Adding games to Lutris.net

Technically, you don't install games with Lutris; you add them, although Lutris can assist you with the install in some cases.

There are several different ways to add games to your Lutris library. The easiest way is to [leverage the Lutris games library][11]: Simply search for a game you own and find its available installers. Many games have several means of installation, depending on how you originally purchased them. For instance, if you purchased a game in a [HumbleBundle][5], use the HumbleBundle installer; if you purchased it from [GOG.com][4], use the GOG installer.

Click to open the installer file. Depending on the installation method, you may be asked to point the installer to the install file you purchased. Lutris takes care of the rest, installing the game to **~/Games** by default (you can modify the location of your game installs in Lutris's preferences).

If the game you're installing is available without login or purchase, Lutris will simply download and install the game.

If the game cannot be obtained over the network, Lutris will prompt you to locate the game's installer file and then proceed with the installation based on the local file you provide.

Once installed, the game's banner is added to your Lutris client, and it is ready for you to launch and play.

### Importing games

If you already have games on your system before installing Lutris or you prefer to manually install games, you can do so.

![manually add a game to lutris][13]

Manually adding a game

First, click the plus ( **+** ) icon at the top of the Lutris window. In the **Add a new game** window that appears, enter the name of the game you're installing. This is for reference only; it's the label that will appear in your Lutris client under the game's banner.

Lutris, like the Linux system running it, can run games written for several different platforms, not just Linux. Lutris calls the subsystems used to run games "runners"—if you're installing a game native to Linux, select the Linux runner.

Next, select the **Game options** tab at the top of the **Add a new game** window. Here, you must show Lutris where the launchable game (the game's executable file) is located. In many cases, the file you're meant to launch is a shell script, often called **start** , **launch** , or something similar, which sets important environment variables and library paths so the game will run as expected. Other times, the game is meant to be launched directly. If you're not sure, test it before entering it into Lutris (you can always edit the entry later if you make a mistake).

![Configuring launch options in Lutris][15]

Configuring launch options

All other fields are optional and largely depend on what the game provides. For instance, some games can be launched with a **\--fullscreen** or **\--windowed** argument to control whether they launch full-screen or in a window, so you could enter your choice in the **Arguments** field to control how Lutris starts the game.

Once a game has been added, it appears in your library with a generic game banner. To customize a game banner, right-click and select **Configure**. In the **Configure** window that appears, you can add your own banner and icon, and edit the launch properties. If you don't have a game banner, you can find community collections on [SteamgridDB][16] and other sites.

### Runners

One of Lutris's killer features is its seamless integration of different gaming systems into one client. You Lutris library can contain native Linux games, peacefully coexisting alongside old NES games, Windows games running in WINE, and games you've purchased on Steam.

To see what emulators and subsystems Lutris provides, go to the **File** menu and select **Manage Runners**. This window lists every emulator available for Lutris and even installs them for you. Once you install a runner, it's available as a launch option when you add a game.

![selecting a runner in lutris][18]

Selecting a runner

Note that most emulators cover a whole host of different systems, and most require separate configuration for keyboard controls. Of course, Lutris doesn't provide any games that run in the emulators, so if you want to play Super Mario Bros., Sonic, or any other classic title, you must own the ROM file (extracted from a cartridge or disk) yourself. There are some very good open source homebrew games for emulated platforms that you can—and should—check out, including [POWDER][19], [Warcraft Tower Defense][20], and [XRick][21].

### Writing your own installer

There are lots of game install scripts on Lutris.net, but there are also lots of games out there in the world. If you find that a game isn't listed on Lutris.net yet, you can write and share an installer of your own.

Since it's all open source, you can learn from existing installers. Go to the [Lutris website][22] and pick a game, then click the drop-down arrow on the right of the game's install button and select **View install script**.

Installer files are written in YAML, a simple configuration file format. The scripts tend to be pretty simple since all they typically need to do is invoke built-in Lutris functions. Here is a simple install script for an imaginary game called myGreatGame:

```
    exe: myGreatGame
    files:
    - file1: 'N/A: Select the ".run.bin" install file downloaded from http://humblebundle.com'
    installer:
    - chmodx: $file1
    - execute:
        args: --destination=$GAMEDIR
        file: $file1
```

The `exe` designation sets the name of the executable file. It's the equivalent of setting the executable field when manually adding a game in the Lutris client.

The `file` attribute is unknown because the installer file is located somewhere on the user's computer. If the file could be downloaded from the Internet directly, then a URL would be provided here; otherwise, Lutris will prompt the user to find the installer file. The variable `$file1` stores a reference to the file.

Finally, the file from the previous step is granted executable permission so Lutris can start the launcher itself. An argument is added to ensure that the game is installed in the appropriate destination (the `$GAMEDIR` variable represents the default game directory as defined by the user), and the installer to launch is set to the file that was downloaded.

From Lutris's perspective, the install process is, and should be, limited. Ideally, an install script needs only to point Lutris to a file, grant the file permission to run, and run the file. Lutris takes care of everything else.

Installer scripts can be a little more complex if necessary. For instance, some games ship with both 32- and 64-bit versions, and your installer script should know which version the user intends to launch. There's nothing built into Lutris to handle that, so here's a version of an installer that creates a special `start.sh` file to detect the system architecture and launch the appropriate version of the game:

```
    files:
    - file1: N/A:Please select the Humble archive
    game:
      exe: $GAMEDIR/start.sh
    installer:
    - chmodx: $file1
    - extract:
        dst: $GAMEDIR
        file: $file1
    - write_file:
        content: '#!/bin/sh if (uname -m | grep "64"); then ARCH="x86_64"; else ARCH="x86";
          fi; ./myGreatGame_$ARCH.bin'
        file: $GAMEDIR/start.sh
    - chmodx: $GAMEDIR/start.sh
```

If you write an installer, don't forget to submit it to Lutris.net so other players can benefit from your hard work.

### Gaming on open source

Lutris may not be a must-have application, but it sure is nice to have. It gives you the freedom to manage your library the way you want to manage it, and it helps you rediscover games you may have squirreled away in some forgotten niche folder. It's open source and a lot of fun to use, so give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/lutris-open-gaming-platform

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://github.com/ValveSoftware/Proton
[2]: https://itch.io/
[3]: https://itch.io/jam/open-jam-2018
[4]: http://gog.com
[5]: http://humblebundle.com
[6]: http://lutris.net
[7]: https://opensource.com/file/412686
[8]: https://opensource.com/sites/default/files/uploads/lutris.png (lutris desktop client)
[9]: https://lutris.net/downloads
[10]: https://opensource.com/article/18/1/how-install-apps-linux
[11]: https://lutris.net/games/
[12]: https://opensource.com/file/412691
[13]: https://opensource.com/sites/default/files/uploads/add.png (manually add a game to lutris)
[14]: https://opensource.com/file/412696
[15]: https://opensource.com/sites/default/files/uploads/add1.png (Configuring launch options in Lutris)
[16]: http://www.steamgriddb.com/
[17]: https://opensource.com/file/412701
[18]: https://opensource.com/sites/default/files/uploads/runners.png (selecting a runner in lutris)
[19]: http://www.zincland.com/powder/index.php?pagename=about
[20]: https://ndswtd.wordpress.com/
[21]: https://pdroms.de/nintendods/xrick-v2-0-nds-game-port
[22]: https://lutris.net/

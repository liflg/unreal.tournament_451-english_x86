Setup.Package
{
    vendor = "liflg.org",
    -- unique identifier, will be proposed as installdirectory SAMPLE: "fakk2"
    id = "ut",
    -- full name of the game, will be used during setup SAMPLE: "Heavy Metal: FAKK2"
    description = "Unreal Tournament",
    -- version of the game SAMPLE: "1.02-english"
    version = "451-english",
    -- name of the splash file which has to be placed inside the meta directory
    splash = "splash.png",
    splashpos = "left",

    superuser = false,
    -- needs to be true if an uninstall-option should be provided
    -- NOTE: atm installing serveral thousands files will slow down the installation process
    write_manifest = true,
    support_uninstall = true,

    recommended_destinations =
    {
        "/usr/local/games",
        "/opt/",
        MojoSetup.info.homedir,
    },

    Setup.Readme
    {
        description = "README",
        source = "README.liflg"
    },

    Setup.Media
    {
        -- unique identifier for the cd/dvd-rom SAMPLE: "fakk2-cd"
        id = "ut-disc1",
        -- this string will be shown to the end-user SAMPLE: "FAKK2-Loki CDROM"
        description = "Unreal Tournament Disc 1",
        -- unique file to decide if a disc is the right one SAMPLE: "fakk/pak0.pk3"
        uniquefile = "System/UNREALTOURNAMENT.EXE"
    },

    Setup.Media
    {
        -- unique identifier for the cd/dvd-rom SAMPLE: "fakk2-cd"
        id = "ut-disc2",
        -- this string will be shown to the end-user SAMPLE: "FAKK2-Loki CDROM"
        description = "Unreal Tournament Disc 2",
        -- unique file to decide if a disc is the right one SAMPLE: "fakk/pak0.pk3"
        uniquefile = "UnrealEd/UnrealEdInstaller.exe"
    },

   Setup.DesktopMenuItem
    {
        disabled = false,
        -- name of the menu-entry. SAMPLE: "Heavy Metal: FAKK2"
        name = "Unreal Tournament",
        -- generic name. SAMPLE: "Ego-Shooter"
        genericname = "Ego-Shooter",
        -- tooltip SAMPLE "play Heavy Metal: FAKK2"
        tooltip = "play Unreal Tournament",
        builtin_icon = false,
        -- path to icon file, realtive to the base-dir of the installation
        icon = "ut.xpm",
        -- gamebinary or startscript, "%0/" stands for the base directory of the installation SAMPLE: "%0/fakk2.sh"
        commandline = "%0/ut",
        category = "Game",
    },

    Setup.Option
    {
        value = true,
        -- user will not be asked about this option, will be installed always
        required = true,
        disabled = false,
        -- size of the files, used only(?) for progressbar, Mojosetup does not check available space
        bytes = 551465020,
        description = "Required game data",
        tooltip = "Needs the Unreal Tournament CDROM",

        Setup.File
        {
            source = "base:///data_451.tar.xz/",
            allowoverwrite = true,
        },

        Setup.File
        {
            source = "base:///Credits.tar.xz/",
            allowoverwrite = true,
        },

        Setup.File
        {
            source="base:///NetGamesUSA.com.tar.xz/",
        },

        Setup.File
        {
            wildcards = { "README.Loki", "ut.xpm", "README.liflg" },
        },

        Setup.File
        {
            wildcards = { "ut", "ucc" },
            permissions = "0755",
        },

        Setup.File
        {
            source = "media://ut-disc1/",
            wildcards = { "System/*.u", "Help/*", "Logs/*", "Maps/*", "Music/*", "Sounds/*.uax", "Textures/*", "Web/*" },
        },


        Setup.File
        {
            source = "base:///libSDL-1.2.tar.xz/",
        },

        Setup.OptionGroup
        {
            description = "Textures",

            Setup.Option
            {
                bytes = 4000,
                description = "Standard",
                Setup.File
                {
                    source="base:///OpenGL.ini.tar.xz/",
                },

            },

            Setup.Option
            {
                value = true,
                bytes = 544286727,
                description = "S3TC Textures",
                Setup.File
                {
                    source="base:///OpenGL_S3TC.ini.tar.xz/",
                },
                Setup.File
                {
                    source = "media://ut-disc2/",
                    wildcards = "Textures/*",
                    allowoverwrite = true,
                },
            },
        },

        Setup.Option
        {

            description = "Install Bonus Pack Collection",
            value = true,
            bytes = 99614720,

            Setup.File
            {
                source = "base:///bp1.tar.xz/",
                allowoverwrite = true,
            },

            Setup.File
            {
                source = "base:///bp2.tar.xz/",
                allowoverwrite = true,
            },

            Setup.File
            {
                source = "base:///bp3.tar.xz/",
                allowoverwrite = true,
            },

            Setup.File
            {
                source = "base:///bp4.tar.xz/",
                allowoverwrite = true,
            },

            Setup.File
            {
                wildcards = "README.bonus.pack.collection",
            },
        },
    },
}

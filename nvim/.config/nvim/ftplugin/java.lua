-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

-- get the current OS
local os
local install_path
local lombok_path
local java_path
local home

if vim.fn.has('mac') == 1 then
  os = 'mac'
elseif vim.fn.has('unix') == 1 then
  os = 'linux'
  home = '$HOME'
  java_path = '/usr/lib/jvm/java-17-openjdk/bin/java'
  install_path = home .. '/jdtls/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/' -- A changer des que possible. Mettre le dossier eclipse.jdt.ls dans .local/share/eclipse
  lombok_path = home .. '/.local/share/eclipse/lombok.jar'
  style_path = home .. '/.local/share/eclipse/'
elseif vim.fn.has('win32') == 1 then
  os = 'win'
  home = 'C:\\Users\\sh4d0w\\AppData\\Local\\JAVA\\'
  java_path = home .. 'jdk-17.0.9\\bin\\java.exe'
  lombok_path = home .. 'lombok.jar'
  style_path = home .. 'JAVA\\style\\'
end

local workspace_dir = home .. 'Projets/workspaces/' .. project_name
local jar_path = home .. 'plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar'
local config_path = home .. 'config_'

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    java_path, -- or '/path/to/java17_or_newer/bin/java'
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:' .. lombok_path,
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jar_path,
    '-configuration', config_path .. os,
    '-data', workspace_dir
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      format = {
        settings = {
          -- Use Google Java style guidelines for formatting
          -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
          -- and place it in the ~/.local/share/eclipse directory
          url = style_path .. 'eclipse-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },  -- Use fernflower to decompile library code
      -- Specify any completion options
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*'
        },
        filteredTypes = {
          'com.sun.*',
          'io.micrometer.shaded.*',
          'java.awt.*',
          'jdk.*', 'sun.*',
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}'
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      -- If you are developing in projects with different Java versions, you need
      -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- And search for `interface RuntimeOption`
      -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
      configuration = {
        runtimes = {
          -- {
          --   name = 'JavaSE-17',
          --   path = home .. '/.asdf/installs/java/corretto-17.0.4.9.1',
          -- },
          -- {
          --   name = 'JavaSE-11',
          --   path = home .. '/.asdf/installs/java/corretto-11.0.16.9.1',
          -- },
          -- {
          --   name = 'JavaSE-1.8',
          --   path = home .. '/.asdf/installs/java/corretto-8.352.08.1'
          -- },
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

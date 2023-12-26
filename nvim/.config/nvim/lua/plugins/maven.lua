return {
  "eatgrass/maven.nvim",
  cmd = { "Maven", "MavenExec" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local maven_path = '/opt/maven/bin/mvn'
    require('maven').setup({
      executable = maven_path, -- `mvn` should be in your `PATH`, or the path to the maven exectable, for example `./mvnw`
      cwd = nil, -- work directory, default to `vim.fn.getcwd()`
      settings = nil, -- specify the settings file or use the default settings
      commands = { -- add custom goals to the command list
        { cmd = { "clean", "compile" }, desc = "clean then compile" },
      },
    })
  end
}

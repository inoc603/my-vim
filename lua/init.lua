if (vim.fs.find("~/.local/share/venv/neovim/bin/python3"))
then
    vim.g.python3_host_prog = "~/.local/share/venv/neovim/bin/python"
    vim.g.python_host_prog = "~/.local/share/venv/neovim/bin/python"
    vim.g.loaded_ruby_provider = 0
    vim.g.loaded_node_provider = 0
    vim.g.loaded_perl_provider = 0
end

require("plugins")

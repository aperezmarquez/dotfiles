{ config, pkgs, ... }

{
    vim.extraPlugins = [
        pkgs.vimPlugins.luasnip
    ];

    vim.luaConfigRC.luasnip = ''
        require("luasnip").setup({
            
        })
    '';
}

{ config, pkgs, ... }:

{
    imports = [
        ./nvf-conf/theme.nix
        ./nvf-conf/image.nix
        ./nvf-conf/lsp-langs-conf.nix
        ./nvf-conf/nvf-plugins.nix
        ./nvf-conf/treesitter.nix
        ./nvf-conf/luasnip.nix
    ];
}

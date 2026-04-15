{ config, pkgs, ... }:

{
    vim = {
        languages = {
            enableFormat = true;
            enableTreesitter = true;

            nix = {
                enable = true;
                lsp.enable = true;
                format.type = "prettier";
            };
            lua = {
                enable = true;
                lsp.enable = true;
                format.type = "prettier";
            };
            python = {
		enable = true;
		lsp.enable = true;
		format.type = "prettier";
	    };
            javascript = {
	    	enable = true;
	    	lsp.enable = true;
		format.type = "prettier";
	    };
            svelte = {
		enable = true;
		lsp.enable = true;
		format.type = "prettier";
	    };
            json = {
		enable = true;
		lsp.enable = true;
		format.type = "prettier";
	    };
            markdown = {
                enable = true;
                lsp.enable = true;

		extensions = {
    		    render-markdown-nvim.enable = true;
  		};
            };
        };

        lsp = {
            enable = true;
            lspconfig.enable = true;
            
            formatOnSave = true;
            lspkind.enable = true;
            lightbulb.enable = false;
            lspsaga.enable = false;
            trouble.enable = false;
            lspSignature.enable = true;
            lsplines.enable = true;
            lspconfig.enable = true;
            nvim-docs-view.enable = true;
            
            servers.svelte = {
                enable = true;
                package = pkgs.svelte-language-server
            };
        };
    };
}

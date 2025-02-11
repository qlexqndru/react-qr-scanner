{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Node.js (using version 16.18.0 as specified in Dockerfile)
    nodejs-18_x

    # Build tools
    yarn
    gcc
    gnumake

    # Development tools
    git

    # Optional but useful development tools
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin:$PATH"
    
    # Ensure npm uses the correct config
    npm config set legacy-peer-deps true

    # Print versions
    echo "Node.js version: $(node --version)"
    echo "npm version: $(npm --version)"
  '';
} 

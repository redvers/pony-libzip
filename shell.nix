with import <nixpkgs> {} ;
pkgs.mkShell {
  buildInputs = with pkgs; [
    ponyc
    pony-corral
    mkdocs
    pkg-config
    libzip
    zlib
  ];
}

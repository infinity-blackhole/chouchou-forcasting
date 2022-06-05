{ pkgs ? import <nixpkgs> { }
, lib
, stdenv
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.docker
    pkgs.nixpkgs-fmt
    (pkgs.python39.withPackages (pypkgs: [ pypkgs.pip ]))
  ];
  shellHook = ''
    export LD_LIBRARY_PATH="${
      lib.makeLibraryPath [ stdenv.cc.cc.lib ]
    }''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
  '';
}

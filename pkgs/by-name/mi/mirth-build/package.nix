{ lib, stdenv, fetchgit, mirth, gcc }:

stdenv.mkDerivation {
  pname = "mirth-build";
  version = "0.0.1";

    name = "mirth-build";

  src = fetchgit {
    url = "https://git.casuallyblue.dev/mirth/mirth-build";
    rev = "270b5fdb21ae2a3561caf56766a89e06e84e782d";
    hash = "sha256-SFnzKL5IWyTqgrm99VgFDvhPzP9gJ5C/4K0vLOrnPoY=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ mirth gcc ];

  hardeningDisable = [ "fortify" ];

  installPhase = ''
    mkdir -p $out/bin
    mv bin/mirth-build $out/bin/mirth-build
  '';

  meta = with lib; {
    description = "Build system for the mirth programming language";
    longDescription = ''
      Mirth is a strongly-typed concatenative programming language
      inspired by Forth, Joy, Haskell, Lisp, and monoidal category theory.
    '';

    homepage = "https://github.com/mirth-lang/mirth";

    license = licenses.bsd0;
    maintainers = [ maintainers.sierra ];
    mainProgram  = "mirth-build";
    platforms = platforms.linux ++ platforms.darwin;
  };
}

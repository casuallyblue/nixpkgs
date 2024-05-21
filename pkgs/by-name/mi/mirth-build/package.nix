{ lib, stdenv, fetchgit, mirth, gcc }:

stdenv.mkDerivation {
  pname = "mirth-build";
  version = "0.0.1";

    name = "mirth-build";

  src = fetchgit {
    url = "https://git.casuallyblue.dev/mirth/mirth-build";
    rev = "04c47c304f2903ac6b98163d0de69ecfc0c29f1e";
    hash = "sha256-5BKwaH5+4oo/FS9TFgqoH7WcjW6XHah7r3efAWc/aGE=";
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

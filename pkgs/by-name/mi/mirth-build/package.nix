{ lib, stdenv, fetchgit, mirth, gcc }:

stdenv.mkDerivation {
  pname = "mirth-build";
  version = "0.0.1";

    name = "mirth-build";

  src = fetchgit {
    url = "https://git.casuallyblue.dev/mirth/mirth-build";
    rev = "9083f5ecbb330dedf9a791827f1ed29a74b4f25c";
    hash = "sha256-3F1ovu0P4Zz6zepUPxYJfY5hrJXdmyLRL0lH4aEOeCc=";
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

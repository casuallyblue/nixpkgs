{ lib, stdenv, fetchgit, mirth, gcc }:

stdenv.mkDerivation {
  pname = "mirth-build";
  version = "0.0.1";

    name = "mirth-build";

  src = fetchgit {
    url = "https://git.casuallyblue.dev/mirth/mirth-build";
    rev = "9dbb9a7aa447d61e05f697e0e3621265039253d1";
    hash = "sha256-00VJjLMBB2yDamZyOa2t8Ff549E2eNgcHwOTosJRfnk=";
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

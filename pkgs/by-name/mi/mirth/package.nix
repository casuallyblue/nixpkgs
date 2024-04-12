{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "mirth";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirth-lang";
    repo = "mirth";
    rev = "6c63998b1b1d951caceb91bb80821793f2c034d5";
    hash = "sha256-WUvQvvGVY9LqGQzpNhr7WiG10W4PqnEPd6dbLpODw0s=";
  };

  installPhase = ''
    mkdir -p $out/bin
    mv bin/mirth2 $out/bin/mirth
  '';

  meta = with lib; {
    description = " Compiler for the Mirth programming language";
    longDescription = ''
      Mirth is a strongly-typed concatenative programming language
      inspired by Forth, Joy, Haskell, Lisp, and monoidal category theory.
    '';

    homepage = "https://github.com/mirth-lang/mirth";

    license = licenses.bsd0;
    maintainers = [ maintainers.sierra ];
    mainProgram  = "mirth";
    platforms = platforms.linux ++ platforms.darwin;
  };
}

{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation {
  pname = "mirth";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirth-lang";
    repo = "mirth";
    rev = "2c9b7f0d05709b7144666a3a4f16a4f7234fba8b";
    hash = "sha256-gr3mjLTBnArq55iSI9+lh8Z7Zom6x5B/tpOlZ+ZeesI=";
  };

  nativeBuildInputs = [
    gcc
  ];

  hardeningDisable = [ "fortify" ];

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

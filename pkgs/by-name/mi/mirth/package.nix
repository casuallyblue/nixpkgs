{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation {
  pname = "mirth";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirth-lang";
    repo = "mirth";
    rev = "d4a0f748bff24f8cb4ca608d543c54bcbb1a16d7";
    hash = "sha256-CymBOJvi2i/gY0B5ZIcMgtPesofPllpTQxewvBYa2bY=";
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

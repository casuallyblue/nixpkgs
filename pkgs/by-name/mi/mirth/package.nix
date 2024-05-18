{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation {
  pname = "mirth";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirth-lang";
    repo = "mirth";
    rev = "de5840b04632aabdd7b089353a29184580d7c87e";
    hash = "sha256-PSffw/k9Fi8l8l87+jEv2s9aw+WREjQ7qmGmDl35Rj0=";
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

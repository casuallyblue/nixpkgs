{ lib, stdenv, fetchFromGitHub, gcc }:

stdenv.mkDerivation {
  pname = "mirth";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "mirth-lang";
    repo = "mirth";
    rev = "3e6a936e33791560c7a6c36abc815b9c89846108";
    hash = "sha256-2medylqez5gAn8bNnfrgX2bTqh9SkLS4NtHH/+lIG/0=";
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

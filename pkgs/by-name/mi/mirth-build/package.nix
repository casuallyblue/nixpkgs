{ lib, stdenv, fetchgit, mirth, gcc }:

stdenv.mkDerivation {
  pname = "mirth-build";
  version = "0.0.1";

    name = "mirth-build";

  src = fetchgit {
    url = "https://git.casuallyblue.dev/mirth/mirth-build";
    rev = "557c80a4b21b99cc39c362adb61bbe660cdd37f4";
    hash = "sha256-6/rcykU+O7o0U2aB3GDl5U6UuTgrKPuAnZFsceaJycY=";
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

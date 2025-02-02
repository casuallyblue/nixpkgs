{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "pyglm";
  version = "2.7.2-rev1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Zuzu-Typ";
    repo = "PyGLM";
    tag = version;
    hash = "sha256-vQ4g2bBr6xV36DYrszcJnaJ8lj1uD1KyUblSL4u+U/E=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "glm" ];

  meta = with lib; {
    homepage = "https://github.com/Zuzu-Typ/PyGLM";
    description = "OpenGL Mathematics (GLM) library for Python written in C++";
    changelog = "https://github.com/Zuzu-Typ/PyGLM/releases/tag/${version}";
    license = licenses.zlib;
    maintainers = with maintainers; [ sund3RRR ];
  };
}

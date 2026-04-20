{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "smclib";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."smclib";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "smclib" = substituteSource {
      src = fetchgit {
        name = "smclib-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "f025b7a0596de96be0bafb9b121e0273bccc6b92";
        hash = "sha256-G3a7QJgz53h6qm+xmJytLGkiWmpnKBH1IxWzTmMmpMU=";
      };
    };
  });
  meta = {
    description = "\n    The State Machine Compiler (SMC) from http://smc.sourceforge.net/\n    converts a language-independent description of a state machine\n    into the source code to support that state machine.\n\n    This package contains the libraries that a compiled state machine\n    depends on, but it does not contain the compiler itself.\n  ";
  };
})

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
  version = "4.3.0-1";
  src = finalAttrs.passthru.sources."smclib";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "smclib" = substituteSource {
      src = fetchgit {
        name = "smclib-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "4182cf5928ba0dd99da994e4c4bd8232ac2f66e2";
        hash = "sha256-CKu/LA7CPMuILYwQJtVNJzmA5HvyfWdNyKwA5/IW/Kw=";
      };
    };
  });
  meta = {
    description = "\n    The State Machine Compiler (SMC) from http://smc.sourceforge.net/\n    converts a language-independent description of a state machine\n    into the source code to support that state machine.\n\n    This package contains the libraries that a compiled state machine\n    depends on, but it does not contain the compiler itself.\n  ";
  };
})

{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-export-dependencies,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_lint_common";
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_lint_common";
  nativeBuildInputs = [ ament-cmake-export-dependencies ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ];
  buildInputs = [ ament-cmake-export-dependencies ];
  propagatedBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_common" = substituteSource {
      src = fetchgit {
        name = "ament_lint_common-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "bc02790520d3490a144ad8556fd0892937fe2919";
        hash = "sha256-cHUrjd4XN0RHdDA6p8nQHjUqjkGv56YVlBJ90mRijEY=";
      };
    };
  });
  meta = {
    description = "The list of commonly used linters in the ament build system in CMake.";
  };
})

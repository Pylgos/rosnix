{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-cppcheck,
  ament-cmake-export-dependencies,
  ament-cmake-lint-cmake,
  ament-cmake-test,
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
  pname = "autoware_lint_common";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_lint_common";
  nativeBuildInputs = [ ament-cmake-export-dependencies ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  buildInputs = [ ament-cmake-export-dependencies ];
  propagatedBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lint_common" = substituteSource {
      src = fetchgit {
        name = "autoware_lint_common-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "b8383386372825be2b3ddff005aa91273f009a13";
        hash = "sha256-ZrTBM29ixuRJR8/jrF1NgVI5FiZ76WAgvuBiZ3Cs0XM=";
      };
    };
  });
  meta = {
    description = "The list of commonly used linters in Autoware";
  };
})

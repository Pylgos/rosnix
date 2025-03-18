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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."autoware_lint_common";
  nativeBuildInputs = [ ament-cmake-export-dependencies ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lint_common" = substituteSource {
      src = fetchgit {
        name = "autoware_lint_common-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "aeb4a628c11c3713b87bfdac6ce32ac1dd9284ba";
        hash = "sha256-cWGM0N7olOhL+JpYFdckmFpfIo70oYlwKB9n3jy2V7o=";
      };
    };
  });
  meta = {
    description = "The list of commonly used linters in Autoware";
  };
})

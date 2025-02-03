{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-pep257,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_pep257";
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_pep257";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-pep257 ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-pep257 ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_pep257" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "87cc7320826778aed349f686b80a636f1123715a";
        hash = "sha256-P5LwKvLnXerFeS6TgjXWUXP02big2WMlPpglrdECAJU=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_pep257 to check code against the docstring style conventions in PEP 257.";
  };
})

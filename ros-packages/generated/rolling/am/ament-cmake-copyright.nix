{
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-copyright,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_copyright";
  version = "0.20.2-1";
  src = finalAttrs.passthru.sources."ament_cmake_copyright";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-copyright ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-copyright ];
  checkInputs = [ ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_copyright" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6d2de36e6e06f94edd23fa170abbc4a1d94e94e5";
        hash = "sha256-5Y68YqG7vj+vsLW7g8v5SPlyefpSZ9J5gyY+tHYyor4=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_copyright to check every source file contains copyright reference.";
  };
})

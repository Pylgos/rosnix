{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-flake8,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_flake8";
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_cmake_flake8";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-flake8 ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-test ament-flake8 ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_flake8" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "bb221883140f686b6d4623c8ffe61d67b1069c7d";
        hash = "sha256-qxbXYf+efKO/csgj4tPr505SFTdY35nf2R9yWlfEiSQ=";
      };
    };
  });
  meta = {
    description = "The CMake API for ament_flake8 to check code syntax and style conventions with flake8.";
  };
})

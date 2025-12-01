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
  version = "0.20.3-1";
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
        rev = "7a77b53ee9fde0eefb20672832f53452f10096b3";
        hash = "sha256-XKiD7S1LISeg2hhJRqt/Rkq3b5v6g4vf+3WdYFlpycg=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_flake8 to check code syntax and style conventions\n    with flake8.\n  ";
  };
})

{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-mypy,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_mypy";
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_mypy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ament-mypy ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_cmake_mypy" = substituteSource {
        src = fetchgit {
          name = "ament_cmake_mypy-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "705ae426f665fa378fe2b962bf460bb85426f6d8";
          hash = "sha256-bEBmui69Fivty7/hw53LagD0lrC9qHgSMMkYZQUzKRE=";
        };
      };
    });
  };
  meta = {
    description = "The CMake API for ament_mypy to perform static type analysis on python code with mypy.";
  };
})

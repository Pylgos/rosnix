{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
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
  pname = "gz_cmake_vendor";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."gz_cmake_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-cmake4" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake4" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gz_cmake_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_cmake_vendor-source";
        url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
        rev = "6a388cca4653c64f3bf201b2cc423223f39f050d";
        hash = "sha256-isXT9VteeyeGhzKwx4379sMx1HxkP8gUqrfbDywVIjE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${sources."gz_cmake_vendor/gz-cmake"}";
        }
      ];
    };
    "gz_cmake_vendor/gz-cmake" = substituteSource {
      src = fetchgit {
        name = "gz-cmake-source";
        url = "https://github.com/gazebosim/gz-cmake.git";
        rev = "1c65374c074268ec93df72be4a2d21722920e62a";
        hash = "sha256-BWgRm+3UW65Cu7TqXtFFG05JlYF52dbpAsIE8aDnJM0=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-cmake4 4.1.1\n\n    Gazebo CMake : CMake Modules for Gazebo Projects\n  ";
  };
})

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
  version = "0.3.3-1";
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
        rev = "3fd22e3b9341de06de7c8bbcb8900a1bb1eff2c4";
        hash = "sha256-ZUDajMrzNpnycZx3YVCe3PN44HIVxEEMUUmJ992LvQg=";
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
        rev = "8e8773306f373024f1eb99cd11eb4d6f4ccd66e6";
        hash = "sha256-gk99F71hZG+VS22o5CqjosaC9WYfd9v42wEy/VULDBM=";
      };
    };
  });
  meta = {
    description = "\n    Vendor package for: gz-cmake4 4.2.1\n\n    Gazebo CMake : CMake Modules for Gazebo Projects\n  ";
  };
})

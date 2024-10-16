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
let
  sources = mkSourceSet (sources: {
    "gz_cmake_vendor" = substituteSource {
      src = fetchgit {
        name = "gz_cmake_vendor-source";
        url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
        rev = "a0b6c7c350fb2cf13eb81c45bf8d9636e671a5f9";
        hash = "sha256-Du1OPUNOy4/njNpEwsNZoqfkZU80+Y8m4gfx9c5EdpM=";
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
        rev = "6e202b72e56bda3965d1efdf6edf8447cc1299cc";
        hash = "sha256-r1XQqx+JqH+ITZIaixgZjA/9weyPq8+LQ1N2ZsIdOK4=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "gz_cmake_vendor";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."gz_cmake_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-cmake4" ]; };
  buildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake4" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Vendor package for: gz-cmake4 4.0.0 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
})

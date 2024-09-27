{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz-cmake-vendor_source-6e202b72e56bda3965d1efdf6edf8447cc1299cc = substituteSource {
      src = fetchgit {
        name = "gz-cmake-vendor_source-6e202b72e56bda3965d1efdf6edf8447cc1299cc-source";
        url = "https://github.com/gazebosim/gz-cmake.git";
        rev = "6e202b72e56bda3965d1efdf6edf8447cc1299cc";
        hash = "sha256-r1XQqx+JqH+ITZIaixgZjA/9weyPq8+LQ1N2ZsIdOK4=";
      };
      substitutions = [
      ];
    };
    gz_cmake_vendor-a0b6c7c350fb2cf13eb81c45bf8d9636e671a5f9 = substituteSource {
      src = fetchgit {
        name = "gz_cmake_vendor-a0b6c7c350fb2cf13eb81c45bf8d9636e671a5f9-source";
        url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
        rev = "a0b6c7c350fb2cf13eb81c45bf8d9636e671a5f9";
        hash = "sha256-Du1OPUNOy4/njNpEwsNZoqfkZU80+Y8m4gfx9c5EdpM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz-cmake-vendor_source-6e202b72e56bda3965d1efdf6edf8447cc1299cc}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_cmake_vendor";
  version = "0.2.0-1";
  src = sources.gz_cmake_vendor-a0b6c7c350fb2cf13eb81c45bf8d9636e671a5f9;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake4" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  meta = {
    description = "Vendor package for: gz-cmake4 4.0.0 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
}

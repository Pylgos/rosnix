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
    gz-cmake-vendor_source-ddd38ff196640024d6e054ff59cf5fea1ef01d73 = substituteSource {
      src = fetchgit {
        name = "gz-cmake-vendor_source-ddd38ff196640024d6e054ff59cf5fea1ef01d73-source";
        url = "https://github.com/gazebosim/gz-cmake.git";
        rev = "ddd38ff196640024d6e054ff59cf5fea1ef01d73";
        hash = "sha256-fnN3Fmp7F5W0JixJUEp2v/OnXzmRidS5ujmSYxIRWto=";
      };
      substitutions = [
      ];
    };
    gz_cmake_vendor-f20c7fd5e142e2fabd75b12ae3576fd7c6a1bc7d = substituteSource {
      src = fetchgit {
        name = "gz_cmake_vendor-f20c7fd5e142e2fabd75b12ae3576fd7c6a1bc7d-source";
        url = "https://github.com/ros2-gbp/gz_cmake_vendor-release.git";
        rev = "f20c7fd5e142e2fabd75b12ae3576fd7c6a1bc7d";
        hash = "sha256-mh1shfa2X3rE8xoqZP26ifszBx1NDE+RqsWMx6QZjj0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz-cmake-vendor_source-ddd38ff196640024d6e054ff59cf5fea1ef01d73}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_cmake_vendor";
  version = "0.0.8-1";
  src = sources.gz_cmake_vendor-f20c7fd5e142e2fabd75b12ae3576fd7c6a1bc7d;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-cmake3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  meta = {
    description = "Vendor package for: gz-cmake3 3.5.3 Gazebo CMake : CMake Modules for Gazebo Projects";
  };
}

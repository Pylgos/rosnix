{
  ament_cmake_core,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  lcov,
  python3Packages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mrt_cmake_modules = substituteSource {
      src = fetchgit {
        name = "mrt_cmake_modules-source";
        url = "https://github.com/ros2-gbp/mrt_cmake_modules-release.git";
        rev = "601662d73c78f5550fb11cf2eca930ed1a05aa80";
        hash = "sha256-OAhwkEQ7sPw4w+eWgo6ca+BV0Sq4c053HhMnKgfZHjU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrt_cmake_modules";
  version = "1.0.10-1";
  src = sources.mrt_cmake_modules;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ gtest_vendor lcov buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.pyyaml buildPackages.python3Packages.setuptools ros_environment ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ gtest_vendor lcov python3Packages.catkin-pkg python3Packages.pyyaml python3Packages.setuptools ros_environment ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "python3-rospkg" ];
  meta = {
    description = "CMake Functions and Modules for automating CMake";
  };
}

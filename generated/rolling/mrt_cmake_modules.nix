{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  rosSystemPackages,
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
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ gtest_vendor ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  buildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gtest_vendor ros_environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake Functions and Modules for automating CMake";
  };
}

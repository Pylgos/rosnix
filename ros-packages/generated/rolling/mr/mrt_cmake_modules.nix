{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  mkSourceSet,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mrt_cmake_modules" = substituteSource {
      src = fetchgit {
        name = "mrt_cmake_modules-source";
        url = "https://github.com/ros2-gbp/mrt_cmake_modules-release.git";
        rev = "930cfff2f400c56712f46b739fe66518bd3cd7a4";
        hash = "sha256-P+/sA/qc4KidP4Kzg1VSvYisUOmLdM7Y7gvrVm87rp8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrt_cmake_modules";
  version = "1.0.11-1";
  src = sources."mrt_cmake_modules";
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

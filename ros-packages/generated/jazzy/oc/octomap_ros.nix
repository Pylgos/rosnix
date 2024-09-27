{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap_msgs,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = mkSourceSet (sources: {
    "octomap_ros" = substituteSource {
      src = fetchgit {
        name = "octomap_ros-source";
        url = "https://github.com/ros2-gbp/octomap_ros-release.git";
        rev = "d6af3a1fb64520d96be193b149c9e36fd856f25b";
        hash = "sha256-O2xNJ++3IWtObx9amtFyVhAFiV1CMHlVbRq43ZawhE0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "octomap_ros";
  version = "0.4.4-1";
  src = sources."octomap_ros";
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ octomap_msgs sensor_msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "octomap_ros provides conversion functions between ROS and OctoMap's native types. This enables a convenvient use of the octomap package in ROS.";
  };
}

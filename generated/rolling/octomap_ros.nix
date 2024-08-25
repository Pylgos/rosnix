{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_msgs,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    octomap_ros = substituteSource {
      src = fetchgit {
        name = "octomap_ros-source";
        url = "https://github.com/ros2-gbp/octomap_ros-release.git";
        rev = "eb4c4fdf125a35a9a3b0f9c45f63fee7117be16a";
        hash = "sha256-O2xNJ++3IWtObx9amtFyVhAFiV1CMHlVbRq43ZawhE0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_ros";
  version = "0.4.4-1";
  src = sources.octomap_ros;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap_msgs sensor_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [ "liboctomap-dev" ];
  meta = {
    description = "octomap_ros provides conversion functions between ROS and OctoMap's native types. This enables a convenvient use of the octomap package in ROS.";
  };
}

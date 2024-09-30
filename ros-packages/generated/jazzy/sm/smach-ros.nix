{
  ament-cmake,
  ament-cmake-python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  smach,
  smach-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "smach_ros" = substituteSource {
      src = fetchgit {
        name = "smach_ros-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "d16b3bef96ff7b3cac35e8f8ec771f6503498842";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "smach_ros";
  version = "3.0.3-3";
  src = sources."smach_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy smach smach-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS. For example, SMACH-ROS can call ROS services, listen to ROS topics, and integrate with";
  };
}

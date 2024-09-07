{
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle,
  lifecycle_msgs,
  rclpy,
  ros_testing,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    lifecycle_py = substituteSource {
      src = fetchgit {
        name = "lifecycle_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "400cb7ad9a3550e4a056bfe1a7249ab03f523820";
        hash = "sha256-FA7CdkffuOXf58i2saMPuSv0VnVWFjNN5xkHSiEvrNM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle_py";
  version = "0.33.5-1";
  src = sources.lifecycle_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common lifecycle ros_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing demos for rclpy lifecycle implementation";
  };
}

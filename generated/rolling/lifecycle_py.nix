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
        rev = "3709ef36abeacdbf04ec1b1ee9b0b772faa82e01";
        hash = "sha256-RlEzOdqd2xp/IFNdMyEWO0oTC+oWkPAcTA7UExNXlBA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle_py";
  version = "0.34.2-1";
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

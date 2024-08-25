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
        rev = "94f453f81ef00cf3b7eb677fc52ab7a39b4fb4a1";
        hash = "sha256-G2SQPzmMZnrFR7ETFon/1Nj1gKgoJxZGMGsV5Ng12Fc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lifecycle_py";
  version = "0.33.4-1";
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

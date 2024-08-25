{
  ament_cmake_ros,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rcl,
  rclc,
  rclc_lifecycle,
  rclc_parameter,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_examples = substituteSource {
      src = fetchgit {
        name = "rclc_examples-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "c337bef2b8518d838a103f525de33bab614c50ab";
        hash = "sha256-oGcnLCr8skjywWIh93EYKzbeJaXxJpnHiJB2rbxQjSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_examples";
  version = "6.1.0-3";
  src = sources.rclc_examples;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces lifecycle_msgs rcl rclc rclc_lifecycle rclc_parameter std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Example of using rclc_executor";
  };
}

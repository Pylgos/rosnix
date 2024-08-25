{
  action_msgs,
  ament_cmake,
  ament_cmake_core,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosidl_default_generators = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "54bd52d5becc6c897650b447e2de370c04c4db05";
        hash = "sha256-+yGCfFFsE0n3AZlq1sE1F6lIt9Tl/2LEwFw/M+U6/6M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_generators";
  version = "1.6.0-3";
  src = sources.rosidl_default_generators;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_core_generators ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_core_generators ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ action_msgs service_msgs ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A configuration package defining the default ROS interface generators.";
  };
}

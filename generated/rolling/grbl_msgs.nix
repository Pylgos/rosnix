{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    grbl_msgs = substituteSource {
      src = fetchgit {
        name = "grbl_msgs-source";
        url = "https://github.com/ros2-gbp/grbl_msgs-release.git";
        rev = "ff01ab1af1a4b9fb91850243c3e97d66664c0f12";
        hash = "sha256-cjvc4arr+Z92IcwzqZryuU4FC2MY+FNpA+6JBe0dhiE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grbl_msgs";
  version = "0.0.2-8";
  src = sources.grbl_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 Messages package for GRBL devices";
  };
}

{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    controller_manager_msgs = substituteSource {
      src = fetchgit {
        name = "controller_manager_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "12d2d172512d945a7db9156e179609f2e6e789d4";
        hash = "sha256-OlHZtmJZBWrk/JYyotALANPhk5QNHEPPtWXD9sPIFX4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_manager_msgs";
  version = "4.15.0-1";
  src = sources.controller_manager_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces lifecycle_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Messages and services for the controller manager.";
  };
}

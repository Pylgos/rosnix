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
        rev = "ce3a55682bdd70d8dbafbd9287eb0503d1423d1c";
        hash = "sha256-mcblgN7cnPOiwbFvSMsZMS/lmwJm1JP1DnqN1KXRayg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_generators";
  version = "1.7.1-1";
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

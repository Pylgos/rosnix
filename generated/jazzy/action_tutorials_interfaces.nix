{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_interfaces = substituteSource {
      src = fetchgit {
        name = "action_tutorials_interfaces-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9f4a74303f417ee9b148c2123a7caf06e93d84de";
        hash = "sha256-yfWyue6LUQAXqSPBfhpeFfsq5VLyCiGIRs/sHP2ados=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_interfaces";
  version = "0.33.4-1";
  src = sources.action_tutorials_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Action tutorials action";
  };
}

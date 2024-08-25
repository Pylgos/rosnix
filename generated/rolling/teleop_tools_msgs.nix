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
  substituteSource,
}:
let
  sources = rec {
    teleop_tools_msgs = substituteSource {
      src = fetchgit {
        name = "teleop_tools_msgs-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "461839276f49df35040f2039934b50d43caf8b6d";
        hash = "sha256-3E7KDUY3Y1ahVWN0MvkVQcLut/HAjodHElxX2AGIdf8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_tools_msgs";
  version = "1.5.0-2";
  src = sources.teleop_tools_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The teleop_tools_msgs package";
  };
}

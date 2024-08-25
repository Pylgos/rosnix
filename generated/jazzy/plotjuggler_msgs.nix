{
  ament_cmake,
  ament_cmake_gtest,
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
    plotjuggler_msgs = substituteSource {
      src = fetchgit {
        name = "plotjuggler_msgs-source";
        url = "https://github.com/ros2-gbp/plotjuggler_msgs-release.git";
        rev = "5edb7b4a405975459292f0410ccdff2e9f11982d";
        hash = "sha256-Lu4ZRsDpvbS2QzbjWOL23H8lsKRSTPGe6MgiCaUedO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler_msgs";
  version = "0.2.3-5";
  src = sources.plotjuggler_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Special Messages for PlotJuggler";
  };
}

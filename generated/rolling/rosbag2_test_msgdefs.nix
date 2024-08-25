{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_test_msgdefs = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8b2e72775fda1737bb0417b6a7591f373f97bc72";
        hash = "sha256-Y1fSc1RmhbsxzCxSrS5DTsfXo2ckWm/KAVtFRnl1QvY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_msgdefs";
  version = "0.28.0-1";
  src = sources.rosbag2_test_msgdefs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
}

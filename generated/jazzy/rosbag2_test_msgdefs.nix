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
        rev = "47d18da60fe893b68a08ff43f3d68282730ea7be";
        hash = "sha256-EOnJSisxerLpUqPsWTxR3JI/8uMqU189Hgf3Txz/ibI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_msgdefs";
  version = "0.26.4-1";
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

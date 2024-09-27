{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_test_msgdefs-cd001c6dd3a02b634037d89941c6b1698ae73948 = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-cd001c6dd3a02b634037d89941c6b1698ae73948-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "cd001c6dd3a02b634037d89941c6b1698ae73948";
        hash = "sha256-gABC2Jr+Dewv+vpLYdtS2eaBtfDmQqv/tRiQFr6be5s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_msgdefs";
  version = "0.29.0-1";
  src = sources.rosbag2_test_msgdefs-cd001c6dd3a02b634037d89941c6b1698ae73948;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "message definition test fixtures for rosbag2 schema recording";
  };
}

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
    rosbag2_test_msgdefs-bef282383314aa625d7bddd297c60ec3b32b26dd = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_msgdefs-bef282383314aa625d7bddd297c60ec3b32b26dd-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "bef282383314aa625d7bddd297c60ec3b32b26dd";
        hash = "sha256-PareRl1TJAfHsDncY42oznfFxSGe+dqtPVfeK8p/Svg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_msgdefs";
  version = "0.26.5-1";
  src = sources.rosbag2_test_msgdefs-bef282383314aa625d7bddd297c60ec3b32b26dd;
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

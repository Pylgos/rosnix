{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "plotjuggler_msgs" = substituteSource {
      src = fetchgit {
        name = "plotjuggler_msgs-source";
        url = "https://github.com/ros2-gbp/plotjuggler_msgs-release.git";
        rev = "2a9c8a2f70e615f842e408e6ca6c4738f3893a11";
        hash = "sha256-Lu4ZRsDpvbS2QzbjWOL23H8lsKRSTPGe6MgiCaUedO4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "plotjuggler_msgs";
  version = "0.2.3-4";
  src = sources."plotjuggler_msgs";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Special Messages for PlotJuggler";
  };
}
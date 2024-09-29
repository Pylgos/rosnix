{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "plotjuggler_msgs" = substituteSource {
      src = fetchgit {
        name = "plotjuggler_msgs-source";
        url = "https://github.com/ros2-gbp/plotjuggler_msgs-release.git";
        rev = "5edb7b4a405975459292f0410ccdff2e9f11982d";
        hash = "sha256-Lu4ZRsDpvbS2QzbjWOL23H8lsKRSTPGe6MgiCaUedO4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "plotjuggler-msgs";
  version = "0.2.3-5";
  src = sources."plotjuggler_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Special Messages for PlotJuggler";
  };
}

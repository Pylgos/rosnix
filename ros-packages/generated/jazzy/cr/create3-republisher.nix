{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "create3_republisher" = substituteSource {
      src = fetchgit {
        name = "create3_republisher-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "7eafd3076f8219e69fad2657f99138711a72c25d";
        hash = "sha256-vMmlNZLCp2fmNzFgrxpu5W9eWVHXlQ7OrimLlsSMH48=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "create3_republisher";
  version = "1.0.0-1";
  src = sources."create3_republisher";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ action server exposing a non-systematic coverage behavior";
  };
}

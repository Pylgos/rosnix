{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pytest,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "diagnostic_aggregator" = substituteSource {
      src = fetchgit {
        name = "diagnostic_aggregator-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "1f45346ec02b79aec789d263341bdaf879eb4832";
        hash = "sha256-xM/v1Cr3gyDZbQhDfQrIVySZTpfixy8wh+/VslO3k9o=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "diagnostic_aggregator";
  version = "4.2.1-1";
  src = sources."diagnostic_aggregator";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-msgs pluginlib rcl-interfaces rclcpp rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch-pytest launch-testing-ament-cmake launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "diagnostic_aggregator";
  };
}

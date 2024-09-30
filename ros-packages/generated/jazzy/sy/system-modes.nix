{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-index-python,
  ament-lint-auto,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros2run,
  rosSystemPackages,
  substituteSource,
  system-modes-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "system_modes" = substituteSource {
      src = fetchgit {
        name = "system_modes-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "fa0c72a8417d876e4a40d82d550d329fd85f9b8a";
        hash = "sha256-0KjnR6c32kc4yM0vwAGYI1LgRZn4tLfIZSO+UE2llbM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "system_modes";
  version = "0.9.0-6";
  src = sources."system_modes";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces launch-ros rclcpp rclcpp-lifecycle system-modes-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gmock ament-cmake-gtest ament-cmake-pep257 ament-cmake-uncrustify ament-index-python ament-lint-auto launch-testing-ament-cmake launch-testing-ros ros2run ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The system modes concept assumes that a robotics system is built from components with a lifecycle. It adds a notion of (sub-)systems, hiararchically grouping these nodes, as well as a notion of modes that determine the configuration of these nodes and (sub-)systems in terms of their parameter values.";
  };
}

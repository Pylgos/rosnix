{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-system-modes,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  system-modes,
  system-modes-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "system_modes_examples" = substituteSource {
      src = fetchgit {
        name = "system_modes_examples-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "82dc72703a933e257875ff35ddd912ed010dc775";
        hash = "sha256-0kfAi8ExAnUicuzTFtWKNQwRZP8qipcdbz4XUrg7EQM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "system_modes_examples";
  version = "0.9.0-6";
  src = sources."system_modes_examples";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch launch-system-modes rclcpp rclcpp-lifecycle ros2launch system-modes system-modes-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gmock ament-cmake-gtest ament-cmake-pep257 ament-cmake-uncrustify ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example systems and according launch files for the system_modes package.";
  };
}

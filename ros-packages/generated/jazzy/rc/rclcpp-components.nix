{
  ament-cmake-google-benchmark,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  class-loader,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rclcpp_components" = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "cc0f4043f5e4c90ce9c6e1a6345ecff5d74773ff";
        hash = "sha256-W2Jh7P63lv44bA2K/9LmEY0MbhdeXt+9btCmBgt5VME=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "28.1.5-1";
  src = sources."rclcpp_components";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp class-loader composition-interfaces rclcpp rcpputils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-google-benchmark ament-cmake-gtest ament-lint-auto ament-lint-common launch-testing std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing tools for dynamically loadable components";
  };
}

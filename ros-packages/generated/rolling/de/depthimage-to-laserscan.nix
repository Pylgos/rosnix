{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-geometry,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "depthimage_to_laserscan" = substituteSource {
      src = fetchgit {
        name = "depthimage_to_laserscan-source";
        url = "https://github.com/ros2-gbp/depthimage_to_laserscan-release.git";
        rev = "d65eba78eb2e659fdff686da9613fa459b6a92a9";
        hash = "sha256-QU8tJNEPEB6X439eDP+kDXczR29OQNtKRX1uXKDqgDo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "depthimage_to_laserscan";
  version = "2.5.1-2";
  src = sources."depthimage_to_laserscan";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image-geometry rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "depthimage_to_laserscan";
  };
}

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
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "tf2_2d" = substituteSource {
      src = fetchgit {
        name = "tf2_2d-source";
        url = "https://github.com/ros2-gbp/tf2_2d-release.git";
        rev = "b51411b00ce51735ebf5fca39ff90ffea39e6b78";
        hash = "sha256-4ty09wIhIUq3vI2s5th/54iRL5jTzcYeDumtwzLqeVk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "tf2_2d";
  version = "1.0.1-3";
  src = sources."tf2_2d";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of 2D geometry classes modeled after the 3D geometry classes in tf2.";
  };
}

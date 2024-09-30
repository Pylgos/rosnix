{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_map_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_map_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "aab0e768daeef2164960cbca7277b82fca2d7d84";
        hash = "sha256-tw7A6h4GJrNAeyyGfNJWeFjBubw4RNlELVvShpA64yM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_map_msgs";
  version = "1.1.0-1";
  src = sources."autoware_map_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware map messages package.";
  };
}

{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    autoware_map_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_map_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "aab0e768daeef2164960cbca7277b82fca2d7d84";
        hash = "sha256-tw7A6h4GJrNAeyyGfNJWeFjBubw4RNlELVvShpA64yM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_map_msgs";
  version = "1.1.0-1";
  src = sources.autoware_map_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware map messages package.";
  };
}

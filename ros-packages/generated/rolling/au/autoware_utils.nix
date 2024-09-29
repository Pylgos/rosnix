{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_utils-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "2e391696f0073bf87109a01b9fd4e3d43f0a280c";
        hash = "sha256-64bVDZx6Rh0NjYj7GrBjcZrD9RGeONzy0Gzq5qQ+1XU=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_utils";
  version = "1.0.0-1";
  src = sources."autoware_utils";
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rclcpp unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The autoware_utils package";
  };
}
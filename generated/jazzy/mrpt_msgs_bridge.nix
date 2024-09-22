{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libobs,
  mrpt_libros_bridge,
  mrpt_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    mrpt_msgs_bridge = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "5eb3bf55693fbbe721956157c0abdd0a49df799a";
        hash = "sha256-dA9YIQTwlPe7wVZO+FloNtCoGql/sDzX3ppPH7VsEEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs_bridge";
  version = "2.1.1-1";
  src = sources.mrpt_msgs_bridge;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs mrpt_libobs mrpt_libros_bridge mrpt_msgs rclcpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
}

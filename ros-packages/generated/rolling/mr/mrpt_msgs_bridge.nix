{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "mrpt_msgs_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "e19ae4511fd0a60df605daa5fc353b17a544250b";
        hash = "sha256-Sk5Tg1H0m/JeksTur+3ngLXeUkNwJmoV0w4+IUSFPjY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_msgs_bridge";
  version = "2.2.0-1";
  src = sources."mrpt_msgs_bridge";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs mrpt_libobs mrpt_libros_bridge mrpt_msgs rclcpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
}

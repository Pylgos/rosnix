{
  ament_cmake_ros,
  buildRosPackage,
  controller_interface,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  realtime_tools,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    picknik_twist_controller-c804147e12cf217d0904037f9dcbf6a71df35071 = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-c804147e12cf217d0904037f9dcbf6a71df35071-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "c804147e12cf217d0904037f9dcbf6a71df35071";
        hash = "sha256-y6aZb1J/2JpuY/SFhUMgaDqYvXU7KiQYiETGOGIYF3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_twist_controller";
  version = "0.0.3-3";
  src = sources.picknik_twist_controller-c804147e12cf217d0904037f9dcbf6a71df35071;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_interface example_interfaces geometry_msgs rclcpp realtime_tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Subscribes to twist msg and forwards to hardware";
  };
}

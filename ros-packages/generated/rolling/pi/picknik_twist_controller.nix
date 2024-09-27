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
    picknik_twist_controller-3b25e7bf6d2761642de9ad7b58f555e1eaf60eba = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-3b25e7bf6d2761642de9ad7b58f555e1eaf60eba-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "3b25e7bf6d2761642de9ad7b58f555e1eaf60eba";
        hash = "sha256-y6aZb1J/2JpuY/SFhUMgaDqYvXU7KiQYiETGOGIYF3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_twist_controller";
  version = "0.0.3-2";
  src = sources.picknik_twist_controller-3b25e7bf6d2761642de9ad7b58f555e1eaf60eba;
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

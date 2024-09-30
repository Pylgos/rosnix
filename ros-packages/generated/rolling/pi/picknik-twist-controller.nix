{
  ament-cmake-ros,
  buildRosPackage,
  controller-interface,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  realtime-tools,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "picknik_twist_controller" = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "3b25e7bf6d2761642de9ad7b58f555e1eaf60eba";
        hash = "sha256-y6aZb1J/2JpuY/SFhUMgaDqYvXU7KiQYiETGOGIYF3I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "picknik-twist-controller";
  version = "0.0.3-2";
  src = sources."picknik_twist_controller";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller-interface example-interfaces geometry-msgs rclcpp realtime-tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Subscribes to twist msg and forwards to hardware";
  };
}
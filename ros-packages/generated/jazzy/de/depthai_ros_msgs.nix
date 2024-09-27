{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosSystemPackages,
  rosidl_default_generators,
  sensor_msgs,
  std_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    depthai_ros_msgs-43af8436e28e4ea676f64b5a5863781a52a89f2b = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-43af8436e28e4ea676f64b5a5863781a52a89f2b-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "43af8436e28e4ea676f64b5a5863781a52a89f2b";
        hash = "sha256-5A0/Z/vwU/rVDNWrOasNe5R5gXfbD/OihxBIewlekOg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_msgs";
  version = "2.10.1-1";
  src = sources.depthai_ros_msgs-43af8436e28e4ea676f64b5a5863781a52a89f2b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp sensor_msgs std_msgs vision_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package to keep interface independent of the driver";
  };
}

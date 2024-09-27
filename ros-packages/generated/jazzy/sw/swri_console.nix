{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl_interfaces,
  rclcpp,
  rosSystemPackages,
  rosbag2_transport,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "swri_console" = substituteSource {
      src = fetchgit {
        name = "swri_console-source";
        url = "https://github.com/ros2-gbp/swri_console-release.git";
        rev = "20be76e51b6c435fc46410a6752bfab906339e97";
        hash = "sha256-zA1cDmzrE6co8sEykB922TKHYC0Dzkqfp9Re4OUxMqk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "swri_console";
  version = "2.0.5-1";
  src = sources."swri_console";
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcl_interfaces rclcpp rosbag2_transport rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-thread-dev" "libqt5-core" "libqt5-gui" "libqt5-opengl-dev" "libqt5-widgets" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A rosout GUI viewer developed at Southwest Research Insititute as an alternative to rqt_console.";
  };
}

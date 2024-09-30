{
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  camera-info-manager,
  depth-image-proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "openni2_camera" = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "9ff1cc5ec71a0d58ceab303ae07f79bda47fd13f";
        hash = "sha256-zluskCIVNU5rB7PJXU3uYl7qJha6gw33mZminvZOkd8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "openni2_camera";
  version = "2.2.1-1";
  src = sources."openni2_camera";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces camera-info-manager depth-image-proc image-transport rclcpp rclcpp-components rosidl-default-runtime sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenni2-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Drivers for the Asus Xtion and Primesense Devices. For using a kinect with ROS, try the";
  };
}

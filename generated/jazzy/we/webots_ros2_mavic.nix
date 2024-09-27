{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_mavic-4a53c806416c2dd8001e9c06550455c6a350256f = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-4a53c806416c2dd8001e9c06550455c6a350256f-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "4a53c806416c2dd8001e9c06550455c6a350256f";
        hash = "sha256-fFjl+kzo8dFp4pJE8dNCeIPEPsjKsD/fBvf49R8oMzQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_mavic";
  version = "2023.1.3-1";
  src = sources.webots_ros2_mavic-4a53c806416c2dd8001e9c06550455c6a350256f;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces rclpy webots_ros2_driver ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Mavic 2 Pro robot ROS2 interface for Webots.";
  };
}

{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    twist_stamper-32213e5bb95ab8a6d3d5202f84bbad81ca359d37 = substituteSource {
      src = fetchgit {
        name = "twist_stamper-32213e5bb95ab8a6d3d5202f84bbad81ca359d37-source";
        url = "https://github.com/ros2-gbp/twist_stamper-release.git";
        rev = "32213e5bb95ab8a6d3d5202f84bbad81ca359d37";
        hash = "sha256-AE3PKMNhcFfc7nbMllXSYBoKhQmRVHLCirRpDAEknEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_stamper";
  version = "0.0.3-4";
  src = sources.twist_stamper-32213e5bb95ab8a6d3d5202f84bbad81ca359d37;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "ROS2 package for converting between Twist and TwistStamped messages";
  };
}

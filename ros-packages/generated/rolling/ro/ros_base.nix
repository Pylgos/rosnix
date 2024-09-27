{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry2,
  kdl_parser,
  mkSourceSet,
  robot_state_publisher,
  rosSystemPackages,
  ros_core,
  rosbag2,
  substituteSource,
  urdf,
}:
let
  sources = mkSourceSet (sources: {
    "ros_base" = substituteSource {
      src = fetchgit {
        name = "ros_base-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "9b8f81587ab619ba9007c0befc8378b3fe060657";
        hash = "sha256-qDeMCM1VeU74XfEYB3E5caLxe/rMeyfJaQYQTyUmR98=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros_base";
  version = "0.11.0-1";
  src = sources."ros_base";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry2 kdl_parser robot_state_publisher ros_core rosbag2 urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package which extends 'ros_core' and includes other basic functionalities like tf2 and urdf.";
  };
}

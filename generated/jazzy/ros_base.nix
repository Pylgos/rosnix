{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry2,
  kdl_parser,
  robot_state_publisher,
  ros_core,
  rosbag2,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    ros_base = substituteSource {
      src = fetchgit {
        name = "ros_base-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "5e0023e0e7580c315c038b95ad50501de894a7d2";
        hash = "sha256-qDeMCM1VeU74XfEYB3E5caLxe/rMeyfJaQYQTyUmR98=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_base";
  version = "0.11.0-1";
  src = sources.ros_base;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry2 kdl_parser robot_state_publisher ros_core rosbag2 urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A package which extends 'ros_core' and includes other basic functionalities like tf2 and urdf.";
  };
}

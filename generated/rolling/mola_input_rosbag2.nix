{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt2,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mola_input_rosbag2 = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b9295da498c9a72734a9f8cc6ba57bdddcd38d63";
        hash = "sha256-xWVGkvHGbON8QceUrG5yicwIaTVrWMsAs7ikz7uAKDc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rosbag2";
  version = "1.1.0-1";
  src = sources.mola_input_rosbag2;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge mola_kernel mrpt2 rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from rosbag2 datasets";
  };
}

{
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libobs,
  mrpt_libros_bridge,
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
        rev = "cdf8ab3bc894560d51b582a255b354295107f7de";
        hash = "sha256-BfopndKeFLMox8X6shlfEpcCk1ALFrLq/llfOcZ3rrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rosbag2";
  version = "1.1.3-1";
  src = sources.mola_input_rosbag2;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge mola_kernel mrpt_libobs mrpt_libros_bridge rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Offline RawDataSource from rosbag2 datasets";
  };
}

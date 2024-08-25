{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  nav_msgs,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_rawlog = substituteSource {
      src = fetchgit {
        name = "mrpt_rawlog-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "5a03a1652379ea3790310ae0ba0420b572345f16";
        hash = "sha256-Iij3u3z+iaZZU8MKUsKQ7gP97W5XHR89X87aQrA/4Qs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_rawlog";
  version = "2.1.0-1";
  src = sources.mrpt_rawlog;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge mrpt2 mrpt_msgs nav_msgs rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Nodes and programs to record and play MRPT rawlogs or to transform between rosbags and rawlogs.";
  };
}

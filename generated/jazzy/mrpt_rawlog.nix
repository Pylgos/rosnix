{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libros_bridge,
  mrpt_libtclap,
  mrpt_msgs,
  nav_msgs,
  rosSystemPackages,
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
        rev = "9b407c307e165d1a47442e4ce8f9faf4eaa5116b";
        hash = "sha256-iBk6TLR19Rb4RQLPWftx2CVjx/ewJ2PCJEP8FuDLWe8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_rawlog";
  version = "2.2.0-1";
  src = sources.mrpt_rawlog;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libros_bridge mrpt_libtclap mrpt_msgs nav_msgs rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nodes and programs to record and play MRPT rawlogs or to transform between rosbags and rawlogs.";
  };
}

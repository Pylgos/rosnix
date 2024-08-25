{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl_conversions,
  pcl_msgs,
  pcl_ros,
  substituteSource,
}:
let
  sources = rec {
    perception_pcl = substituteSource {
      src = fetchgit {
        name = "perception_pcl-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "c6d5610ecc4b14db1155d4cf0dc3fcd20b777111";
        hash = "sha256-P/Qu0+b3vRkm+jivWMUPgmcBsnB+nSLxDlJDEOmtuCQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception_pcl";
  version = "2.6.1-3";
  src = sources.perception_pcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl_conversions pcl_msgs pcl_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred bridge for 3D applications involving n-D Point Clouds and 3D geometry processing in ROS.";
  };
}

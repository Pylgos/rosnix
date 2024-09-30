{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pcl-msgs,
  pcl-ros,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "perception_pcl" = substituteSource {
      src = fetchgit {
        name = "perception_pcl-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "95b50e2aced7d1d6c743f13b7debe0960e9285a8";
        hash = "sha256-P/Qu0+b3vRkm+jivWMUPgmcBsnB+nSLxDlJDEOmtuCQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "perception_pcl";
  version = "2.6.1-4";
  src = sources."perception_pcl";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred bridge for 3D applications involving n-D Point Clouds and 3D geometry processing in ROS.";
  };
}

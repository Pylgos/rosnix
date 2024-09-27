{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rviz_2d_overlay_msgs,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_2d_overlay_plugins-ef1d6cf9de03f4c0db3a7f47cdde9ed6bde6208e = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_plugins-ef1d6cf9de03f4c0db3a7f47cdde9ed6bde6208e-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "ef1d6cf9de03f4c0db3a7f47cdde9ed6bde6208e";
        hash = "sha256-5KPjUMZyqAgUXuO87e61O6tTFRDf9qA4oCK56AOXXPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_2d_overlay_plugins";
  version = "1.3.0-3";
  src = sources.rviz_2d_overlay_plugins-ef1d6cf9de03f4c0db3a7f47cdde9ed6bde6208e;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rviz_2d_overlay_msgs rviz_common rviz_ogre_vendor rviz_rendering std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RViz2 plugin for 2D overlays in the 3D view. Mainly a ROS2 port of the JSK overlay plugin (https://github.com/jsk-ros-pkg/jsk_visualization).";
  };
}

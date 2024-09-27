{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_gui_vendor,
  gz_msgs_vendor,
  gz_plugin_vendor,
  gz_rendering_vendor,
  gz_sim_vendor,
  gz_transport_vendor,
  menge_vendor,
  mkSourceSet,
  rclcpp,
  rmf_door_msgs,
  rmf_fleet_msgs,
  rmf_lift_msgs,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rmf_building_sim_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_gz_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "f4456eab04356539da4fdccccde696260e82c7d6";
        hash = "sha256-duYHwQRSX20g+iDWR99abmt/7Os5XLyv1a/5Qrt5TYA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rmf_building_sim_gz_plugins";
  version = "2.4.0-1";
  src = sources."rmf_building_sim_gz_plugins";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_gui_vendor gz_msgs_vendor gz_plugin_vendor gz_rendering_vendor gz_sim_vendor gz_transport_vendor menge_vendor rclcpp rmf_door_msgs rmf_fleet_msgs rmf_lift_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-qml" "libqt5-quick" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo plugins for building infrastructure simulation";
  };
}

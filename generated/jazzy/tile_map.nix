{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mapviz,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  swri_math_util,
  swri_transform_util,
  tf2,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tile_map = substituteSource {
      src = fetchgit {
        name = "tile_map-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "73ecd90d1cab837ad85ab51c5ef346339c19599a";
        hash = "sha256-WgyvpkklqyW7zCw3sbLORctYh38D3EtwOim++l7tyQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tile_map";
  version = "2.4.3-1";
  src = sources.tile_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ mapviz pluginlib rclcpp swri_math_util swri_transform_util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglew-dev" "libjsoncpp" "libjsoncpp-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tile map provides a slippy map style interface for visualizing OpenStreetMap and GoogleMap tiles. A mapviz visualization plug-in is also implemented";
  };
}

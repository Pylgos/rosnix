{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  glew,
  jsoncpp,
  libyamlcpp,
  mapviz,
  pluginlib,
  qt5,
  rclcpp,
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
        rev = "3ae04968aa594d37582aca744f5121e2b72940bd";
        hash = "sha256-0iUL8wMHfRRc8jU2qyjNoCspfh4GFBeQQhI2FwAgF9Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tile_map";
  version = "2.3.0-2";
  src = sources.tile_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ glew jsoncpp libyamlcpp mapviz pluginlib qt5.qtbase rclcpp swri_math_util swri_transform_util tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Tile map provides a slippy map style interface for visualizing OpenStreetMap and GoogleMap tiles. A mapviz visualization plug-in is also implemented";
  };
}

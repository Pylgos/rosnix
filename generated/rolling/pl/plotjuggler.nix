{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    plotjuggler-2a2120c06bc724ecacb11bcba7b307ece63c3ab9 = substituteSource {
      src = fetchgit {
        name = "plotjuggler-2a2120c06bc724ecacb11bcba7b307ece63c3ab9-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "2a2120c06bc724ecacb11bcba7b307ece63c3ab9";
        hash = "sha256-btYnAV/G2I+WURDeN8C6WfMHh79M4e4l5Ix9Zx7srrs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plotjuggler";
  version = "3.9.2-1";
  src = sources.plotjuggler-2a2120c06bc724ecacb11bcba7b307ece63c3ab9;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp fastcdr rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lz4" "protobuf-dev" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "PlotJuggler: juggle with data";
  };
}

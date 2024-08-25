{
  ament_cmake,
  ament_index_cpp,
  binutils,
  buildRosPackage,
  cppzmq,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  lz4,
  protobuf,
  python3Packages,
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
  zstd,
}:
let
  sources = rec {
    plotjuggler = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
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
  src = sources.plotjuggler;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp binutils cppzmq fastcdr lz4 protobuf python3Packages.boost qt5.qtbase qt5.qtsvg qt5.qtwebsockets qt5.qtx11extras rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "PlotJuggler: juggle with data";
  };
}

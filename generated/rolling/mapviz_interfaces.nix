{
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    mapviz_interfaces = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "21fa0f6f3d8a5bf65e7388b564a3ae824eda257a";
        hash = "sha256-rYyoJaGeXYVTz+zNNdikD4+2i+gWQFabeVsFZQL/4aY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz_interfaces";
  version = "2.3.0-2";
  src = sources.mapviz_interfaces;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces marti_common_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS interfaces used by Mapviz";
  };
}

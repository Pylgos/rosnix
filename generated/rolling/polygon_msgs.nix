{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    polygon_msgs = substituteSource {
      src = fetchgit {
        name = "polygon_msgs-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "7f1b96b7130ec39f760059be3a1cba078c0f1578";
        hash = "sha256-6gLLltnSdYNP7QkYUOAj9bdphjw1W6jDytYsbJL7DA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_msgs";
  version = "1.0.2-2";
  src = sources.polygon_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "General purpose two-dimensional polygons. Formerly a part of nav_2d_msgs";
  };
}

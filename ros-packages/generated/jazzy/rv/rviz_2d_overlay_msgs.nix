{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rviz_2d_overlay_msgs-d95be3fa314cb8cbff835e30b8558cd4cd04670a = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_msgs-d95be3fa314cb8cbff835e30b8558cd4cd04670a-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "d95be3fa314cb8cbff835e30b8558cd4cd04670a";
        hash = "sha256-5D74IzZ2A8JXaF9VzMxWd4WryX6A8MsUtaz+3ZRBFK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_2d_overlay_msgs";
  version = "1.3.0-3";
  src = sources.rviz_2d_overlay_msgs-d95be3fa314cb8cbff835e30b8558cd4cd04670a;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Messages describing 2D overlays for RVIZ, extracted/derived from the jsk_visualization ROS1 packege.";
  };
}

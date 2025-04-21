{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depth_obstacle_detect_ros_msgs";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."depth_obstacle_detect_ros_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "depth_obstacle_detect_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "depth_obstacle_detect_ros_msgs-source";
        url = "https://github.com/ros2-gbp/depth_obstacle_detect_ros-release.git";
        rev = "33b8c7e1ce6257363801fdcb5025307da2501ce3";
        hash = "sha256-/6AYcxsrTKy7Iim0vTHkIyarT32OkeM/BY60r/ZxLMw=";
      };
    };
  });
  meta = {
    description = "A message package for depth_obstacle_detect_ros package";
  };
})

{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_msgs";
  version = "0.1.4-2";
  src = finalAttrs.passthru.sources."moveit_task_constructor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ moveit-msgs rosidl-default-generators rosidl-default-runtime visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-msgs rosidl-default-generators rosidl-default-runtime visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_msgs" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "c650827e70635fdf46ecd582bb5e5d7631fa7e7d";
        hash = "sha256-w2xBKmIL9JFTykVX1CVMoBzmcmXXArbX/+Y/j9+Ed5g=";
      };
    };
  });
  meta = {
    description = "Messages for MoveIt Task Pipeline";
  };
})

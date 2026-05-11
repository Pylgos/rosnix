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
  version = "0.1.5-1";
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
        rev = "e2d033f5b393cc36b27a87e19c31cfb29addea55";
        hash = "sha256-KObCykuVCRtgTDNlw/mVqN6oTCOXkiB2a4FHUPYTNkU=";
      };
    };
  });
  meta = {
    description = "Messages for MoveIt Task Pipeline";
  };
})

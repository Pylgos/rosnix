{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_actions_msgs";
  version = "2.5.0-2";
  src = finalAttrs.passthru.sources."hri_actions_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "hri_actions_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_actions_msgs-source";
        url = "https://github.com/ros2-gbp/hri_actions_msgs-release.git";
        rev = "a98192ac1b9ae1a75607a978068b5928c6b70920";
        hash = "sha256-YXG3XmOpDnHAVICxaBzncb7n/h1jjsbBYgaK+ndnYOc=";
      };
    };
  });
  meta = {
    description = "Action definitions useful for Human-Robot Interaction";
  };
})

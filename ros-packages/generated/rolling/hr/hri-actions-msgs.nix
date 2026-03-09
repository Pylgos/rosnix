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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."hri_actions_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "hri_actions_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_actions_msgs-source";
        url = "https://github.com/ros4hri/hri_actions_msgs-release.git";
        rev = "f6a4256b3518b74fcf61faadece598d06f13db6e";
        hash = "sha256-YXG3XmOpDnHAVICxaBzncb7n/h1jjsbBYgaK+ndnYOc=";
      };
    };
  });
  meta = {
    description = "Action definitions useful for Human-Robot Interaction";
  };
})

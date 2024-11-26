{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "derived_object_msgs";
  version = "4.0.0-4";
  src = finalAttrs.passthru.sources."derived_object_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime shape-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "derived_object_msgs" = substituteSource {
      src = fetchgit {
        name = "derived_object_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "cd2176913fed3e36da3aa4941492f377c3ff662f";
        hash = "sha256-gHKh+ix0fZzuNvAtc/i+u0v6YLY+jUfqW9BPaLgC0/U=";
      };
    };
  });
  meta = {
    description = "Abstracted Messages from Perception Modalities";
  };
})

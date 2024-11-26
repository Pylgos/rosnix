{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-core-runtime,
  service-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_default_runtime";
  version = "1.7.1-1";
  src = finalAttrs.passthru.sources."rosidl_default_runtime";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs rosidl-core-runtime service-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_default_runtime" = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "7326804d446ce5351ebec700d02fce00af208ef0";
        hash = "sha256-RMOLLNeW7tpo4RtB1vJ3OV29gTjs+8Uvxyeyg/RPhjc=";
      };
    };
  });
  meta = {
    description = "A configuration package defining the runtime for the ROS interfaces.";
  };
})

{
  ament-cmake,
  ament-lint-common,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_msgs";
  version = "0.40.1-1";
  src = finalAttrs.passthru.sources."tf2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tf2_msgs" = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "861355f95e3cb122ec873daf28a6b2f1dfd45a85";
        hash = "sha256-xH6vV5vfgFMWMQjo2bi+K3wynFh6vB1rkXyhCwHbWp4=";
      };
    };
  });
  meta = {
    description = "tf2_msgs";
  };
})

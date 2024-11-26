{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_lift_msgs";
  version = "3.4.1-1";
  src = finalAttrs.passthru.sources."rmf_lift_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_lift_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_lift_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "041b8b78190f17034eec7cda6822b08bb8500139";
        hash = "sha256-YrRzAwJ/RV1Ww0HglHczin9lq6MS0F7/gbMq2xq3lb4=";
      };
    };
  });
  meta = {
    description = "Messages used to interface to lifts.";
  };
})

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
  pname = "rmf_scheduler_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_scheduler_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_scheduler_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_scheduler_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "d40a5614e9077377f640f4a586e750854445d04f";
        hash = "sha256-3zAFv7LHunEzlakF5IHJkZ1/w2WPt/F200Q1VacM0IM=";
      };
    };
  });
  meta = {
    description = "Messages used by rmf_scheduler_msgs";
  };
})

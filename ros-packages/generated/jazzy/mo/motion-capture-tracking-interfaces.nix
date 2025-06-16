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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "motion_capture_tracking_interfaces";
  version = "1.0.6-1";
  src = finalAttrs.passthru.sources."motion_capture_tracking_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "motion_capture_tracking_interfaces" = substituteSource {
      src = fetchgit {
        name = "motion_capture_tracking_interfaces-source";
        url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
        rev = "2a178ab90b498fd0db4c44ba130dba742b36cd7c";
        hash = "sha256-RlYQPGdzy32vO2tIVjbfRf87Kn1yYxVjw8+FbTGA++8=";
      };
    };
  });
  meta = {
    description = "Interfaces for motion_capture_tracking package.";
  };
})

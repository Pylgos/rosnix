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
  version = "1.0.3-3";
  src = finalAttrs.passthru.sources."motion_capture_tracking_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "motion_capture_tracking_interfaces" = substituteSource {
        src = fetchgit {
          name = "motion_capture_tracking_interfaces-source";
          url = "https://github.com/ros2-gbp/motion_capture_tracking-release.git";
          rev = "d3cb19d132f7ebed6e4e1845c9b859f4d217da8b";
          hash = "sha256-ho+25GyuWOKXqZqIp74ZO8leEndRFRqfn74DBKWKZWk=";
        };
      };
    });
  };
  meta = {
    description = "Interfaces for motion_capture_tracking package.";
  };
})

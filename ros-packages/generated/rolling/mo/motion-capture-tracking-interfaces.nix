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
  version = "1.0.3-2";
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
          rev = "a9b72a5a549beb50b53da5959a19bc658d535966";
          hash = "sha256-ho+25GyuWOKXqZqIp74ZO8leEndRFRqfn74DBKWKZWk=";
        };
      };
    });
  };
  meta = {
    description = "Interfaces for motion_capture_tracking package.";
  };
})

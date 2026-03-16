{
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
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "multisensor_calibration_interface";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."multisensor_calibration_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "multisensor_calibration_interface" = substituteSource {
      src = fetchgit {
        name = "multisensor_calibration_interface-source";
        url = "https://github.com/ros2-gbp/multisensor_calibration-release.git";
        rev = "ae324908d22a8c8a97ca4c843a815ce289ac94b4";
        hash = "sha256-Jq4O49Y+T+tRila0Ow8jalNIYoiPjeJBRDO5mUPpsak=";
      };
    };
  });
  meta = {
    description = "\n    Messages and service definitions for the multisensor_calibration package.\n  ";
  };
})

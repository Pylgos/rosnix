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
  version = "2.0.4-1";
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
        rev = "4b8ea9d43b1072f99b8336f9517160e71ca015c4";
        hash = "sha256-9QxLiNNV1ldnVHj71/TxoyTsl3r8IBx5kshyzHHybLA=";
      };
    };
  });
  meta = {
    description = "\n    Messages and service definitions for the multisensor_calibration package.\n  ";
  };
})

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
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."multisensor_calibration_interface";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "multisensor_calibration_interface" = substituteSource {
      src = fetchgit {
        name = "multisensor_calibration_interface-source";
        url = "https://github.com/ros2-gbp/multisensor_calibration-release.git";
        rev = "a0120778a18cd339b1173b0896a144c117e61ec3";
        hash = "sha256-Idx7rE3rcMHcV9Ude5aJpySGeW0VvEoKPet0CIShmRk=";
      };
    };
  });
  meta = {
    description = "Messages and service definitions for the multisensor_calibration package.";
  };
})

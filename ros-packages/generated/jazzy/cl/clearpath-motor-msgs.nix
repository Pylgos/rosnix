{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_motor_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."clearpath_motor_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_motor_msgs" = substituteSource {
      src = fetchgit {
        name = "clearpath_motor_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "b5f8ba81ee415eaa94eeac072aca2e8396222fe2";
        hash = "sha256-Y0fPcIgbkqJjUu29L7/uiXIdVAB2yPt9Tb04D2fi4bQ=";
      };
    };
  });
  meta = {
    description = "Messages for Clearpath Motor Drivers.";
  };
})

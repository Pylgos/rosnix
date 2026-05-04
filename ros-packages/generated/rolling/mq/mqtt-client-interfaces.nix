{
  ament-cmake,
  buildAmentCmakePackage,
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
  pname = "mqtt_client_interfaces";
  version = "2.4.1-3";
  src = finalAttrs.passthru.sources."mqtt_client_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mqtt_client_interfaces" = substituteSource {
      src = fetchgit {
        name = "mqtt_client_interfaces-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "fba0ca4dbc4474abed071d4b855a09ebc2de58b7";
        hash = "sha256-npS7oPm75qFKVzqPM0mi+HbsqcFK4rxZlf3IAQU3K78=";
      };
    };
  });
  meta = {
    description = "Message and service definitions for mqtt_client";
  };
})

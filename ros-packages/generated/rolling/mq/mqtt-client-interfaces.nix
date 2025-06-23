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
  version = "2.4.0-1";
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
        rev = "db1e3a64764e234423cf6a42e67c8ba1baa9b82c";
        hash = "sha256-woWJs+NTzEjeGkQUpMLEcTlewE03T0KI9w1TBkaJamU=";
      };
    };
  });
  meta = {
    description = "Message and service definitions for mqtt_client";
  };
})

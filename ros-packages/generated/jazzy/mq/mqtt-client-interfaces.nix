{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mqtt_client_interfaces";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."mqtt_client_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mqtt_client_interfaces" = substituteSource {
      src = fetchgit {
        name = "mqtt_client_interfaces-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "ec05d23655623974f238aeb0e689822995659a2c";
        hash = "sha256-uodTNl9Jgjak1DPQpOe1aOEwSCdyfYY8zvExpOctHJE=";
      };
    };
  });
  meta = {
    description = "Message and service definitions for mqtt_client";
  };
})

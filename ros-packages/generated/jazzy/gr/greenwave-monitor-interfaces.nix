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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "greenwave_monitor_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."greenwave_monitor_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "greenwave_monitor_interfaces" = substituteSource {
      src = fetchgit {
        name = "greenwave_monitor_interfaces-source";
        url = "https://github.com/ros2-gbp/greenwave_monitor-release.git";
        rev = "17e9e2ce34ba56b492cfdd28b714d4b79c39adee";
        hash = "sha256-OhR8iR8PxtCs+YJOF3On32dw+prARD2P3+QjsaS2xaA=";
      };
    };
  });
  meta = {
    description = "Interfaces for the greenwave_monitor package";
  };
})

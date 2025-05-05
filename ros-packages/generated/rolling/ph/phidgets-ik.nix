{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  phidgets-analog-inputs,
  phidgets-digital-inputs,
  phidgets-digital-outputs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_ik";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_ik";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch phidgets-analog-inputs phidgets-digital-inputs phidgets-digital-outputs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch phidgets-analog-inputs phidgets-digital-inputs phidgets-digital-outputs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_ik" = substituteSource {
      src = fetchgit {
        name = "phidgets_ik-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "4b7d15946d7e8093ad678c95a57397b94e663031";
        hash = "sha256-8IA8dKcL9AG0xtXDPn5m0P13buJaZryijdm8U9hjXWc=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets InterfaceKit devices";
  };
})

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
  version = "2.4.0-1";
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
        rev = "68b140da616f1f2e678a5986ef75ac98cb79d73b";
        hash = "sha256-faNwpRcho7cElbtNZrFUYJkX7s2QrRCQ0Env7sskaIo=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets InterfaceKit devices";
  };
})

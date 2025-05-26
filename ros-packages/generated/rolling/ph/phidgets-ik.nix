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
  version = "2.3.4-1";
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
        rev = "8878c3026886fa33ad025849ed6478f8be5a8b9f";
        hash = "sha256-bHaghhVl7Q+jBvP6w2xOec1jWmD33/n8wjZD3loar3w=";
      };
    };
  });
  meta = {
    description = "Driver for the Phidgets InterfaceKit devices";
  };
})

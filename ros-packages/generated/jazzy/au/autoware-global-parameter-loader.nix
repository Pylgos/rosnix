{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_global_parameter_loader";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_global_parameter_loader";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-vehicle-info-utils ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-vehicle-info-utils ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_global_parameter_loader" = substituteSource {
      src = fetchgit {
        name = "autoware_global_parameter_loader-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "86ced01f8d88b27a15f3fa7913e855e529a401c9";
        hash = "sha256-UQA9sNUAh0Vjz5VrI2TyefGPSXdnh//reSN+YjLAHfw=";
      };
    };
  });
  meta = {
    description = "The autoware_global_parameter_loader package";
  };
})

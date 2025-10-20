{
  ament-cmake,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beckhoff_ads_bringup";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."beckhoff_ads_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-manager robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "beckhoff_ads_bringup" = substituteSource {
      src = fetchgit {
        name = "beckhoff_ads_bringup-source";
        url = "https://github.com/b-robotized/beckhoff_ads_driver-release.git";
        rev = "15fb46661e071743b5ed66959877fa1121c7e90e";
        hash = "sha256-vjdxihNKi+Fwuod//oJIjqw8JqzYdcxIdEB0aW/2GqY=";
      };
    };
  });
  meta = {
    description = "Demo bringup package for beckhoff_ads_hardware_interface";
  };
})

{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_abstract_core";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_abstract_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_abstract_core" = substituteSource {
      src = fetchgit {
        name = "mbf_abstract_core-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "8a799a14c648aacf754496387bdf86d149a4ec08";
        hash = "sha256-yBJc4J80YJx+dQStHXJ4h+32yCiyXY1dWasCA6H0xzI=";
      };
    };
  });
  meta = {
    description = "\n      This package provides common interfaces for navigation specific robot actions. It contains the AbstractPlanner, AbstractController and AbstractRecovery plugin interfaces. This interfaces have to be implemented by the plugins to make the plugin available for Move Base Flex. The abstract classes provides a meaningful interface enabling the planners, controllers and recovery behaviors to return information, e.g. why something went wrong. Derivided interfaces can, for example, provide methods to initialize the planner, controller or recovery with map representations like costmap_2d, grid_map or other representations.\n  ";
  };
})

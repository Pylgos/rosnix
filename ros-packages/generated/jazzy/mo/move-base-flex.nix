{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mbf-abstract-core,
  mbf-abstract-nav,
  mbf-msgs,
  mbf-simple-nav,
  mbf-utility,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "move_base_flex";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."move_base_flex";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mbf-abstract-core mbf-abstract-nav mbf-msgs mbf-simple-nav mbf-utility ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mbf-abstract-core mbf-abstract-nav mbf-msgs mbf-simple-nav mbf-utility ];
  passthru.sources = mkSourceSet (sources: {
    "move_base_flex" = substituteSource {
      src = fetchgit {
        name = "move_base_flex-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "3403dcd10b9a2d2d75517eb7dfe8f84b9b9d73d5";
        hash = "sha256-NgK0eOxO72nfK72auxiONLNCShA7AW1j2+8GJAyf/us=";
      };
    };
  });
  meta = {
    description = "\n       Move Base Flex (MBF) is a backwards-compatible replacement for move_base. MBF can use existing plugins for move_base, and provides an enhanced version of the planner, controller and recovery plugin ROS interfaces. It exposes action servers for planning, controlling and recovering, providing detailed information of the current state and the plugin’s feedback. An external executive logic can use MBF and its actions to perform smart and flexible navigation strategies. Furthermore, MBF enables the use of other map representations, e.g. meshes or grid_map\n       \n       This package is a meta package and refers to the Move Base Flex stack packages.The abstract core of MBF – without any binding to a map representation – is represented by the ";
  };
})

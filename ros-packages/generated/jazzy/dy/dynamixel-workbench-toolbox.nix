{
  ament-cmake,
  buildAmentCmakePackage,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dynamixel_workbench_toolbox";
  version = "2.2.5-1";
  src = finalAttrs.passthru.sources."dynamixel_workbench_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-sdk ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk ];
  passthru.sources = mkSourceSet (sources: {
    "dynamixel_workbench_toolbox" = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_toolbox-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "1a54aae353181e78df8aab0ffec866e47002addf";
        hash = "sha256-X71HPKbFUoex2mIm9l5WvT1zmEHrB1+t3dtqpYyf0cw=";
      };
    };
  });
  meta = {
    description = "\n    This package is composed of 'dynamixel_item', 'dynamixel_tool', 'dynamixel_driver' and 'dynamixel_workbench' class.\n    The 'dynamixel_item' is saved as control table item and information of DYNAMIXEL.\n    The 'dynamixel_tool' class loads its by model number of DYNAMIXEL.\n    The 'dynamixel_driver' class includes wraped function used in DYNAMIXEL SDK.\n    The 'dynamixel_workbench' class make simple to use DYNAMIXEL.\n  ";
  };
})
